/* Copyright (C) 2005-2019 Shugo Maeda <shugo@ruby-lang.org> and Charlie Savage <cfis@savagexi.com>
   Please see the LICENSE file for copyright and distribution information */

#include "rp_allocation.h"
#include "rp_call_info.h"
#include "rp_method.h"

VALUE cRpMethodInfo;

/* ================  Helper Functions  =================*/
VALUE
resolve_klass(VALUE klass, unsigned int *klass_flags)
{
    VALUE result = klass;

    if (klass == 0 || klass == Qnil)
    {
        result = Qnil;
    }
    else if (BUILTIN_TYPE(klass) == T_CLASS && FL_TEST(klass, FL_SINGLETON))
    {
        /* We have come across a singleton object. First
           figure out what it is attached to.*/
        VALUE attached = rb_iv_get(klass, "__attached__");

        /* Is this a singleton class acting as a metaclass? */
        if (BUILTIN_TYPE(attached) == T_CLASS)
        {
            *klass_flags |= kClassSingleton;
            result = attached;
        }
        /* Is this for singleton methods on a module? */
        else if (BUILTIN_TYPE(attached) == T_MODULE)
        {
            *klass_flags |= kModuleSingleton;
            result = attached;
        }
        /* Is this for singleton methods on an object? */
        else if (BUILTIN_TYPE(attached) == T_OBJECT)
        {
            *klass_flags |= kObjectSingleton;
            result = rb_class_superclass(klass);
        }
        /* Ok, this could be other things like an array made put onto
           a singleton object (yeah, it happens, see the singleton
           objects test case). */
        else
        {
            *klass_flags |= kOtherSingleton;
            result = klass;
        }
    }
    /* Is this an include for a module?  If so get the actual
        module class since we want to combine all profiling
        results for that module. */
    else if (BUILTIN_TYPE(klass) == T_ICLASS)
    {
        unsigned int dummy;
        *klass_flags |= kModuleIncludee;
        result = resolve_klass(RBASIC(klass)->klass, &dummy);
    }
    return result;
}

VALUE
resolve_klass_name(VALUE klass, unsigned int* klass_flags)
{
    VALUE result = Qnil;

    if (klass == Qnil)
    {
        result = rb_str_new2("[global]");
    }
    else if (*klass_flags & kOtherSingleton)
    {
        result = rb_any_to_s(klass);
    }
    else
    {
        result = rb_class_name(klass);
    }

    return result;
}

st_data_t
method_key(VALUE klass, VALUE msym)
{
    VALUE resolved_klass = klass;

    /* Is this an include for a module?  If so get the actual
        module class since we want to combine all profiling
        results for that module. */
    if (klass == 0 || klass == Qnil)
    {
        resolved_klass = Qnil;
    }
    else if (BUILTIN_TYPE(klass) == T_ICLASS)
    {
        resolved_klass = RBASIC(klass)->klass;
    }

    return (resolved_klass << 4) + (msym);
}

/* ======   Allocation Table  ====== */
st_table*
allocations_table_create()
{
    return st_init_numtable();
}

static int
allocations_table_free_iterator(st_data_t key, st_data_t value, st_data_t dummy)
{ 
    prof_allocation_free((prof_allocation_t*)value);
    return ST_CONTINUE;
}

static int
prof_method_collect_allocations(st_data_t key, st_data_t value, st_data_t result)
{
    prof_allocation_t* allocation = (prof_allocation_t*)value;
    VALUE arr = (VALUE)result;
    rb_ary_push(arr, prof_allocation_wrap(allocation));
    return ST_CONTINUE;
}

static int
prof_method_mark_allocations(st_data_t key, st_data_t value, st_data_t data)
{
    prof_allocation_t* allocation = (prof_allocation_t*)value;
    prof_allocation_mark(allocation);
    return ST_CONTINUE;
}

void
allocations_table_free(st_table* table)
{
    st_foreach(table, allocations_table_free_iterator, 0);
    st_free_table(table);
}

/* ================  prof_method_t   =================*/
static prof_method_t*
prof_get_method(VALUE self)
{
    /* Can't use Data_Get_Struct because that triggers the event hook
       ending up in endless recursion. */
    prof_method_t* result = DATA_PTR(self);

    if (!result)
        rb_raise(rb_eRuntimeError, "This RubyProf::MethodInfo instance has already been freed, likely because its profile has been freed.");

    return result;
}

prof_method_t*
prof_method_create(VALUE klass, VALUE msym, VALUE source_file, int source_line)
{
    prof_method_t *result = ALLOC(prof_method_t);
    result->key = method_key(klass, msym);
    result->klass_flags = 0;

    /* Note we do not call resolve_klass_name now because that causes an object allocation that shows up 
       in the allocation results so we want to avoid it until after the profile run is complete. */
    result->klass = resolve_klass(klass, &result->klass_flags);
    result->klass_name = Qnil;
    result->method_name = msym;
    result->measurement = prof_measurement_create();

    result->root = false;
    result->excluded = false;

    result->parent_call_infos = method_table_create();
    result->child_call_infos = method_table_create();
    result->allocations_table = allocations_table_create();
    
    result->visits = 0;
    result->recursive = false;

    result->object = Qnil;

    result->source_file = source_file;
    result->source_line = source_line;

    return result;
}

prof_method_t*
prof_method_create_excluded(VALUE klass, VALUE msym)
{
    prof_method_t* result = prof_method_create(klass, msym, Qnil, 0);
    result->excluded = 1;
    return result;
}

static int
prof_method_collect_call_infos(st_data_t key, st_data_t value, st_data_t result)
{
    prof_call_info_t* call_info = (prof_call_info_t*)value;
    VALUE arr = (VALUE)result;
    rb_ary_push(arr, prof_call_info_wrap(call_info));
    return ST_CONTINUE;
}

static int
prof_method_mark_call_infos(st_data_t key, st_data_t value, st_data_t data)
{
    prof_call_info_t* call_info = (prof_call_info_t*)value;
    prof_call_info_mark(call_info);
    return ST_CONTINUE;
}

static int
call_infos_free_iterator(st_data_t key, st_data_t value, st_data_t dummy)
{
    prof_call_info_free((prof_call_info_t*)value);
    return ST_CONTINUE;
}

void
call_info_table_free(st_table* table)
{
    st_foreach(table, call_infos_free_iterator, 0);
    st_free_table(table);
}

/* The underlying c structures are freed when the parent profile is freed.
   However, on shutdown the Ruby GC frees objects in any will-nilly order.
   That means the ruby thread object wrapping the c thread struct may
   be freed before the parent profile.  Thus we add in a free function
   for the garbage collector so that if it does get called will nil
   out our Ruby object reference.*/
static void
prof_method_ruby_gc_free(void *data)
{
    prof_method_t* method = (prof_method_t*)data;

    /* Has this thread object been accessed by Ruby?  If
	   yes clean it up so to avoid a segmentation fault. */
	if (method->object != Qnil)
	{
		RDATA(method->object)->data = NULL;
		RDATA(method->object)->dfree = NULL;
		RDATA(method->object)->dmark = NULL;
	}
	method->object = Qnil;
    method->klass_name = Qnil;
    method->method_name = Qnil;
}

static void
prof_method_free(prof_method_t* method)
{
	prof_method_ruby_gc_free(method);
    allocations_table_free(method->allocations_table);

    /* Remember call infos are referenced by their parent method and child method, so we only want
       to iterate over one of them to avoid a double freeing */
    call_info_table_free(method->parent_call_infos);
    xfree(method->child_call_infos);

    xfree(method);
}

size_t
prof_method_size(const void *data)
{
    return sizeof(prof_method_t);
}

void
prof_method_mark(void *data)
{
    prof_method_t* method = (prof_method_t*)data;
    rb_gc_mark(method->klass_name);
    rb_gc_mark(method->method_name);
    
    if (method->klass != Qnil)
        rb_gc_mark(method->klass);

    if (method->object != Qnil)
		rb_gc_mark(method->object);

    prof_measurement_mark(method->measurement);
    
    st_foreach(method->parent_call_infos, prof_method_mark_call_infos, 0);
    st_foreach(method->child_call_infos, prof_method_mark_call_infos, 0);
    st_foreach(method->allocations_table, prof_method_mark_allocations, 0);
}

static const rb_data_type_t method_info_type =
{
    .wrap_struct_name = "MethodInfo",
    .function =
    {
        .dmark = prof_method_mark,
        .dfree = prof_method_ruby_gc_free,
        .dsize = prof_method_size,
    },
    .data = NULL,
    .flags = RUBY_TYPED_FREE_IMMEDIATELY
};

static VALUE
prof_method_allocate(VALUE klass)
{
    prof_method_t* method_data = prof_method_create(Qnil, Qnil, Qnil, 0);
    method_data->object = prof_method_wrap(method_data);
    return method_data->object;
}

VALUE
prof_method_wrap(prof_method_t *method)
{
  if (method->object == Qnil)
  {
      method->object = TypedData_Wrap_Struct(cRpMethodInfo, &method_info_type, method);
  }
  return method->object;
}

prof_method_t *
prof_method_get(VALUE self)
{
    /* Can't use Data_Get_Struct because that triggers the event hook
       ending up in endless recursion. */
	prof_method_t* result = DATA_PTR(self);

	if (!result)
    {
	    rb_raise(rb_eRuntimeError, "This RubyProf::MethodInfo instance has already been freed, likely because its profile has been freed.");
	}

   return result;
}

st_table *
method_table_create()
{
    return st_init_numtable();
}

static int
method_table_free_iterator(st_data_t key, st_data_t value, st_data_t dummy)
{
    prof_method_free((prof_method_t *)value);
    return ST_CONTINUE;
}

void
method_table_free(st_table *table)
{
    st_foreach(table, method_table_free_iterator, 0);
    st_free_table(table);
}

size_t
method_table_insert(st_table *table, st_data_t key, prof_method_t *val)
{
    return st_insert(table, (st_data_t) key, (st_data_t) val);
}

prof_method_t *
method_table_lookup(st_table *table, st_data_t key)
{
    st_data_t val;
    if (st_lookup(table, (st_data_t)key, &val))
    {
      return (prof_method_t *) val;
    }
    else
    {
      return NULL;
    }
}

/* ================  Method Info   =================*/
/* Document-class: RubyProf::MethodInfo
The RubyProf::MethodInfo class stores profiling data for a method.
One instance of the RubyProf::MethodInfo class is created per method
called per thread.  Thus, if a method is called in two different
thread then there will be two RubyProf::MethodInfo objects
created.  RubyProf::MethodInfo objects can be accessed via
the RubyProf::Profile object.
*/

/* call-seq:
   callers -> array

Returns an array of call info objects that called this method  (ie, parents).*/
static VALUE
prof_method_callers(VALUE self)
{
    prof_method_t* method = prof_get_method(self);
    VALUE result = rb_ary_new();
    st_foreach(method->parent_call_infos, prof_method_collect_call_infos, result);
    return result;
}

/* call-seq:
   callees -> array

Returns an array of call info objects that this method called (ie, children).*/
static VALUE
prof_method_callees(VALUE self)
{
    prof_method_t* method = prof_get_method(self);
    VALUE result = rb_ary_new();
    st_foreach(method->child_call_infos, prof_method_collect_call_infos, result);
    return result;
}

/* call-seq:
   allocations -> array

Returns an array of allocation information.*/
static VALUE
prof_method_allocations(VALUE self)
{
    prof_method_t* method = prof_get_method(self);
    VALUE result = rb_ary_new();
    st_foreach(method->allocations_table, prof_method_collect_allocations, result);
    return result;
}

/* call-seq:
   called -> Measurement

Returns the measurement associated with this method. */
static VALUE
prof_method_measurement(VALUE self)
{
    prof_method_t* method = prof_get_method(self);
    return prof_measurement_wrap(method->measurement);
}

/* call-seq:
   source_file => string

return the source file of the method
*/
static VALUE prof_method_source_file(VALUE self)
{
    prof_method_t* method = prof_method_get(self);
    return method->source_file;
}

/* call-seq:
   line_no -> int

   returns the line number of the method */
static VALUE
prof_method_line(VALUE self)
{
    prof_method_t* method = prof_method_get(self);
    return INT2FIX(method->source_line);
}

/* call-seq:
   klass_name -> string

Returns the name of this method's class.  Singleton classes
will have the form <Object::Object>. */

static VALUE
prof_method_klass_name(VALUE self)
{
    prof_method_t *method = prof_method_get(self);
    if (method->klass_name == Qnil)
        method->klass_name = resolve_klass_name(method->klass, &method->klass_flags);

    return method->klass_name;
}

/* call-seq:
   klass_flags -> integer

Returns the klass flags */

static VALUE
prof_method_klass_flags(VALUE self)
{
    prof_method_t* method = prof_method_get(self);
    return INT2FIX(method->klass_flags);
}

/* call-seq:
   method_name -> string

Returns the name of this method in the format Object#method.  Singletons
methods will be returned in the format <Object::Object>#method.*/

static VALUE
prof_method_name(VALUE self)
{
    prof_method_t *method = prof_method_get(self);
    return method->method_name;
}

/* call-seq:
   root? -> boolean

   Returns the true if this method is at the top of the call stack */
static VALUE
prof_method_root(VALUE self)
{
    prof_method_t *method = prof_method_get(self);
    return method->root ? Qtrue : Qfalse;
}

/* call-seq:
   recursive? -> boolean

   Returns the true if this method is recursively invoked */
static VALUE
prof_method_recursive(VALUE self)
{
    prof_method_t* method = prof_method_get(self);
    return method->recursive ? Qtrue : Qfalse;
}

/* call-seq:
   excluded? -> boolean

   Returns the true if this method was excluded */
static VALUE
prof_method_excluded(VALUE self)
{
    prof_method_t* method = prof_method_get(self);
    return method->excluded ? Qtrue : Qfalse;
}

/* :nodoc: */
static VALUE
prof_method_dump(VALUE self)
{
    prof_method_t* method_data = DATA_PTR(self);
    VALUE result = rb_hash_new();

    rb_hash_aset(result, ID2SYM(rb_intern("klass_name")), prof_method_klass_name(self));
    rb_hash_aset(result, ID2SYM(rb_intern("klass_flags")), INT2FIX(method_data->klass_flags));
    rb_hash_aset(result, ID2SYM(rb_intern("method_name")), method_data->method_name);

    rb_hash_aset(result, ID2SYM(rb_intern("key")), INT2FIX(method_data->key));
    rb_hash_aset(result, ID2SYM(rb_intern("root")), prof_method_root(self));
    rb_hash_aset(result, ID2SYM(rb_intern("recursive")), prof_method_recursive(self));
    rb_hash_aset(result, ID2SYM(rb_intern("excluded")), prof_method_excluded(self));
    rb_hash_aset(result, ID2SYM(rb_intern("source_file")), method_data->source_file);
    rb_hash_aset(result, ID2SYM(rb_intern("source_line")), INT2FIX(method_data->source_line));

    rb_hash_aset(result, ID2SYM(rb_intern("measurement")), prof_measurement_wrap(method_data->measurement));

    rb_hash_aset(result, ID2SYM(rb_intern("callers")), prof_method_callers(self));
    rb_hash_aset(result, ID2SYM(rb_intern("callees")), prof_method_callees(self));

    rb_hash_aset(result, ID2SYM(rb_intern("allocations")), prof_method_allocations(self));

    return result;
}

/* :nodoc: */
static VALUE
prof_method_load(VALUE self, VALUE data)
{
    prof_method_t* method_data = RDATA(self)->data;
    method_data->object = self;

    method_data->klass_name = rb_hash_aref(data, ID2SYM(rb_intern("klass_name")));
    method_data->klass_flags = FIX2INT(rb_hash_aref(data, ID2SYM(rb_intern("klass_flags"))));
    method_data->method_name = rb_hash_aref(data, ID2SYM(rb_intern("method_name")));
    method_data->key = FIX2LONG(rb_hash_aref(data, ID2SYM(rb_intern("key"))));

    method_data->root = rb_hash_aref(data, ID2SYM(rb_intern("root"))) == Qtrue ? true : false;
    method_data->recursive = rb_hash_aref(data, ID2SYM(rb_intern("recursive"))) == Qtrue ? true : false;
    method_data->excluded = rb_hash_aref(data, ID2SYM(rb_intern("excluded"))) == Qtrue ? true : false;

    method_data->source_file = rb_hash_aref(data, ID2SYM(rb_intern("source_file")));
    method_data->source_line = FIX2INT(rb_hash_aref(data, ID2SYM(rb_intern("source_line"))));

    VALUE measurement = rb_hash_aref(data, ID2SYM(rb_intern("measurement")));
    method_data->measurement = prof_get_measurement(measurement);

    VALUE callers = rb_hash_aref(data, ID2SYM(rb_intern("callers")));
    for (int i = 0; i < rb_array_len(callers); i++)
    {
        VALUE call_info = rb_ary_entry(callers, i);
        prof_call_info_t *call_info_data = prof_get_call_info(call_info);
        st_data_t key = call_info_data->parent ? call_info_data->parent->key : method_key(Qnil, 0);
        call_info_table_insert(method_data->parent_call_infos, key, call_info_data);
    }

    VALUE callees = rb_hash_aref(data, ID2SYM(rb_intern("callees")));
    for (int i = 0; i < rb_array_len(callees); i++)
    {
        VALUE call_info = rb_ary_entry(callees, i);
        prof_call_info_t *call_info_data = prof_get_call_info(call_info);

        st_data_t key = call_info_data->method ? call_info_data->method->key : method_key(Qnil, 0);
        call_info_table_insert(method_data->child_call_infos, key, call_info_data);
    }

    VALUE allocations = rb_hash_aref(data, ID2SYM(rb_intern("allocations")));
    for (int i = 0; i < rb_array_len(allocations); i++)
    {
        VALUE allocation = rb_ary_entry(allocations, i);
        prof_allocation_t* allocation_data = prof_allocation_get(allocation);

        st_insert(method_data->allocations_table, allocation_data->key, (st_data_t)allocation_data);
    }
    return data;
}

void rp_init_method_info()
{
    /* MethodInfo */
    cRpMethodInfo = rb_define_class_under(mProf, "MethodInfo", rb_cData);
    rb_undef_method(CLASS_OF(cRpMethodInfo), "new");
    rb_define_alloc_func(cRpMethodInfo, prof_method_allocate);

    rb_define_method(cRpMethodInfo, "klass_name", prof_method_klass_name, 0);
    rb_define_method(cRpMethodInfo, "klass_flags", prof_method_klass_flags, 0);

    rb_define_method(cRpMethodInfo, "method_name", prof_method_name, 0);
 
    rb_define_method(cRpMethodInfo, "callers", prof_method_callers, 0);
    rb_define_method(cRpMethodInfo, "callees", prof_method_callees, 0);
    rb_define_method(cRpMethodInfo, "allocations", prof_method_allocations, 0);

    rb_define_method(cRpMethodInfo, "measurement", prof_method_measurement, 0);
        
    rb_define_method(cRpMethodInfo, "source_file", prof_method_source_file, 0);
    rb_define_method(cRpMethodInfo, "line", prof_method_line, 0);

    rb_define_method(cRpMethodInfo, "root?", prof_method_root, 0);
    rb_define_method(cRpMethodInfo, "recursive?", prof_method_recursive, 0);
    rb_define_method(cRpMethodInfo, "excluded?", prof_method_excluded, 0);

    rb_define_method(cRpMethodInfo, "_dump_data", prof_method_dump, 0);
    rb_define_method(cRpMethodInfo, "_load_data", prof_method_load, 1);
}
