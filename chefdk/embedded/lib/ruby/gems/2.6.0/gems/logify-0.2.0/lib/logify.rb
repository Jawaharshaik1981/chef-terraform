require 'logify/logger'
require 'logify/version'

module Logify
  # @private
  LEVEL_ID = 'logify.level'

  # @private
  IO_ID = 'logify.io'

  class << self
    # @private
    def included(base)
      base.send(:extend,  ClassMethods)
      base.send(:include, InstanceMethods)
    end

    # @private
    def logger_for(name)
      loggers[name] ||= Logger.new(name)
    end

    #
    # Reset the current loggers for all thread instances.
    #
    # @return [true]
    #
    def reset!
      Thread.list.each do |thread|
        thread[LEVEL_ID] = nil
        thread[IO_ID]    = nil
      end

      loggers.clear
      true
    end

    #
    # The current log level.
    #
    # @return [Fixnum]
    #
    def level
      Thread.current[LEVEL_ID] || Thread.main[LEVEL_ID] || Logger::DEFAULT
    end

    #
    # Set the global log level. All loggers in the current thread will
    # immediately begin using this new log level.
    #
    # @example Setting the log level to +:fatal+
    #   Logify.level = :fatal
    #
    # @param [Symbol] id
    #   the symbol id of the logger
    #
    # @return [Fixnum]
    #
    def level=(id)
      Thread.current[LEVEL_ID] = Logger::LEVEL_MAP.fetch(id, Logger::DEFAULT)
    end

    #
    # The IO stream to log to. Default: +$stdout+.
    #
    # @return [IO]
    #
    def io
      Thread.current[IO_ID] || Thread.main[IO_ID] || $stdout
    end

    #
    # Set the global io object. All loggers in the current thread will
    # immediately begin using this new IO stream. It is the user's
    # responsibility to manage this IO object (like rewinding and closing).
    #
    # @example Setting the outputter to +$stderr+
    #   Logify.io = $stderr
    #
    # @example Using an IO object
    #   io = StringIO.new
    #   Logify.io = io
    #
    # @param [IO] io
    #   the IO object to output to
    #
    # @return [IO]
    #
    def io=(io)
      Thread.current[IO_ID] = io
    end

    #
    # Add a filter parameter to Logify.
    #
    # @example Filter a password in the logger
    #   Logify.filter('P@s$w0r)')
    #   log.debug "This is the P@s$w0r)" #=> "This is the [FILTERED]"
    #
    # @return [void]
    #
    def filter(param)
      filters[param] = nil
    end

    #
    # The list of filters for Logify.
    #
    # @return [Hash]
    #
    def filters
      @filters ||= {}
    end

    private

    # @private
    def loggers
      @loggers ||= {}
    end
  end

  # Class methods that get extended into any including object.
  module ClassMethods
    #
    # Write a message to the logger for this class.
    #
    # @return [Logger]
    #
    def log
      @log ||= Logify.logger_for(name)
    end
  end

  # Instance methods that get included into any including object.
  module InstanceMethods
    #
    # Write a message to the logger for this instance's class.
    #
    # @return [Logger]
    #
    def log
      @log ||= Logify.logger_for(self.class.name)
    end
  end
end
