TARGET = libyajl
DLLIB = $(TARGET).so
all:

install:
	mkdir -p /opt/chefdk/embedded/lib/ruby/gems/2.6.0/gems/libyajl2-1.2.0/lib/libyajl2/vendored-libyajl2/lib
	cp $(DLLIB) /opt/chefdk/embedded/lib/ruby/gems/2.6.0/gems/libyajl2-1.2.0/lib/libyajl2/vendored-libyajl2/lib/$(DLLIB)
	mkdir -p /opt/chefdk/embedded/lib/ruby/gems/2.6.0/gems/libyajl2-1.2.0/lib/libyajl2/vendored-libyajl2/include/yajl
	cp yajl/*.h /opt/chefdk/embedded/lib/ruby/gems/2.6.0/gems/libyajl2-1.2.0/lib/libyajl2/vendored-libyajl2/include/yajl
