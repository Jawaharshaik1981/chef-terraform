Logify
======
Logify is an incredibly light-weight Ruby logger with a developer-friendly API and no dependencies. It is intentionally very opinionated and is optimized for speed. This combination makes it perfect for command line applications.

Logify does:

- Support multithreading with inherited defaults
- Provide a very pretty debug logger
- Make logging fun again!

Logify does not:

- Depend on or inherit from Ruby's core `Logger` class
- Manage the log device - if you wish to write your logs to a file, it is your responsibility to manage the file handler, rewind, etc.


Usage
-----
Simply include the `Logify` module in each class you want to log:

```ruby
require 'logify'

class MyClass
  include Logify
end
```

This will expose a `log` method on both the class and instance:

```ruby
MyClass.log 'This is a class log message!'

instance = MyClass.new
instance.log 'This is an instance log message!'
```

In debug mode, Logify is designed for developer happiness. Parameters are aligned, and visual queues are used to indicate status. The format is as follows:

```text
MyClass | ===> Starting some command...
MyClass |      x = 0
MyClass |      y = 99
MyClass | **** x is 0
MyClass | >>>> Cannot divide by 0
MyClass | !!!! Ruby segfaulted
```

Where the prefixes are:

```ruby
FATAL #=> "!!!!"
ERROR #=> ">>>>"
WARN  #=> "****"
INFO  #=> "===>"
DEBUG #=> "    "
```

Class names are automatically shortened if they exceed 32 characters.

In non-debug mode, Logify is less chatty:

```text
I: Starting some command
W: x is 0
E: Cannot divide by 0
F: Ruby segfaulted
```

Where the letter corresponds to the log level:

```ruby
FATAL #=> "F"
ERROR #=> "E"
WARN  #=> "W"
INFO  #=> "I"
```

If you are anti-modules (or if you want to use `log` for something else), you can manually create your Logger object in an initializer:

```ruby
require 'logify'

class MyClass
  def initialize
    @logger = Logify.logger_for(self.class.name) # Or any custom name
  end
end
```

And then use `@logger` to call your log methods:

```ruby
def other_method
  @logger.info 'Running other_method'
end
```

Configuring
-----------
Logify is configurable via the top-level `Logify` module.

Set the log level using symbol definitions:

```ruby
Logify.level = :warn
```

Set the output object (io). It must respond to `<<`:

```ruby
Logify.io = StringIO.new
```

The Logify module is thread-aware. Settings are inherited from the main thread. Changes to log levels in child threads are only persisted within the thread.

```ruby
# Main thread configuration
Logify.level = :warn

Thread.new do
  # This will persist for the duration of this thread.
  # The main thread will continue to use :warn.
  Logify.level = :debug

  Thread.new do
    # The log level is _only_ inherited from the main thread.
    Logify.level #=> :warn
  end
end
```

You can disable all logging by setting the `io` device to a null object:

```ruby
class NullLogger
  def <<(*args); end
end
Logify.io = NullLogger.new
```

Or set the `log_level` to `:none`:

```ruby
Logify.level = :none
```

If you are logging sensitive information (such as passwords and API keys), you can add that information as a filter to Logify. Logify will replace those values with "`[FILTERED]`" in logging output.

```ruby
Logify.filter('P@s$w0r)')
```


Installation
------------
Add this line to your application's Gemfile:

```ruby
gem 'logify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install logify


Contributing
------------
1. Fork it
1. Fix it
1. Test it
1. Pull Request it


License & Authors
-----------------
- Author: Seth Vargo (<sethvargo@gmail.com>)

```text
Copyright 2014, Seth Vargo (sethvargo@gmail.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
