require 'monitor'

module Logify
  class Logger
    class << self
      #
      # @private
      #
      # @macro level
      #   @method $1(message = nil, &block)
      #     Write a new $1 message to the current IO object.
      #
      #     @example Write a +:$1+ message
      #       log.$1 'This is a message'
      #
      #     @example Write a lazy evaluated +:$1+ message
      #       log.$1 { perform_complex_operation }
      #
      #     @param [String] message
      #       the message to log
      #     @param [Proc] block
      #       the block to call that returns a string to write
      #
      #     @return [String]
      #       the compiled log message
      #
      def level(name)
        constant = name.to_s.upcase

        class_eval <<-EOH, __FILE__, __LINE__ + 1
          def #{name}(message = nil, &block)
            if Logify.level <= #{constant}
              buffer = ''

              if Logify.level == #{DEBUG}
                buffer << formatted_id
                buffer << SEPARATOR
                buffer << PREFIX_LONG_#{constant}
              else
                buffer << PREFIX_#{constant}
              end

              buffer << filter(message) if message
              buffer << filter(yield)   if block_given?
              buffer << "#{NEWLINE}"

              MONITOR.synchronize { Logify.io.write(buffer) }

              buffer
            end
          end
        EOH
      end
    end

    ANONYMOUS  = '(Anonymous)'
    FILTERED   = '[FILTERED]'
    MAX_LENGTH = 32
    NEWLINE    = "\n"
    SEPARATOR  = ' | '
    MONITOR    = Monitor.new

    NONE  = 5
    FATAL = 4
    ERROR = 3
    WARN  = 2
    INFO  = 1
    DEBUG = 0

    DEFAULT = WARN

    LEVEL_MAP = {
      none:  NONE,
      fatal: FATAL,
      error: ERROR,
      warn:  WARN,
      info:  INFO,
      debug: DEBUG,
    }.freeze

    PREFIX_FATAL = 'F: '
    PREFIX_ERROR = 'E: '
    PREFIX_WARN  = 'W: '
    PREFIX_INFO  = 'I: '
    PREFIX_DEBUG = 'D: '

    PREFIX_LONG_FATAL = '!!!! '
    PREFIX_LONG_ERROR = '>>>> '
    PREFIX_LONG_WARN  = '**** '
    PREFIX_LONG_INFO  = '===> '
    PREFIX_LONG_DEBUG = '     '

    level :fatal
    level :error
    level :warn
    level :info
    level :debug

    #
    # Create a new logger object.
    #
    # @param [String, nil] id
    #   the ID of the logger object to create
    #
    def initialize(id)
      @id = id
    end

    private

    #
    # @private
    #
    # The truncated id (for debug only).
    #
    # @return [String]
    #   the formatted id
    #
    def formatted_id
      return @formatted_id if @formatted_id

      # Account for anonymous classes
      id = @id ? @id.to_s : ANONYMOUS

      if id.length == MAX_LENGTH
        @formatted_id = id
      elsif id.length < MAX_LENGTH
        @formatted_id = id.rjust(MAX_LENGTH)
      else
        temp = id

        until temp.length <= MAX_LENGTH
          if temp.include?('::')
            temp = temp.split('::')[1..-1].join('::')
          else
            temp = id[-MAX_LENGTH..-1]
          end
        end

        @formatted_id = temp.rjust(MAX_LENGTH)
      end
    end

    #
    # @private
    #
    # Filter the given string of any filtered parameters.
    #
    # @see Logify.filter
    #
    # @param [String]
    #   the string to filter
    #
    # @return [String]
    #   the filtered string
    #
    def filter(string)
      string.dup.tap do |copy|
        Logify.filters.each do |param, _|
          copy.gsub!(param, FILTERED)
        end
      end
    end
  end
end
