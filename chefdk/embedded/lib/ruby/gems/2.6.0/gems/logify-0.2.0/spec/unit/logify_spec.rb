require 'spec_helper'

module Logify
  describe do
    before { Logify.reset! }

    describe '.level & .level=' do
      it 'defaults to WARN' do
        expect(Logify.level).to eq(Logger::WARN)
      end

      it 'uses the level set in the main thread' do
        Logify.level = :fatal
        Thread.new { Logify.level = :warn }.join
        expect(Logify.level).to eq(Logger::FATAL)
      end

      it 'uses the level set in the current thread' do
        Logify.level = :fatal
        Thread.new do
          Logify.level = :debug
          expect(Logify.level).to eq(Logger::DEBUG)
        end.join

        # Make sure the parent thread isn't modified
        expect(Logify.level).to eq(Logger::FATAL)
      end

      it 'uses the level set in the main thread' do
        Logify.level = :fatal

        # Set the log level in another thread
        Thread.new { Logify.level }.join

        # Since Logify.level = :fatal was set in the main thread,
        # it should be the default moving forward
        Thread.new { expect(Logify.level).to eq(Logger::FATAL) }.join
      end
    end

    describe '.logger_for' do
      it 'uses a cached logger' do
        logger = double
        Logify.send(:loggers)['default'] = logger
        expect(Logify.logger_for('default')).to be(logger)
      end

      it 'creates a new logger when one does not exist' do
        Logger.stub(:new)
        expect(Logger).to receive(:new).with('default').once
        Logify.logger_for('default')
      end
    end

    describe '.included' do
      let(:klass)    { Class.new { include Logify } }
      let(:instance) { klass.new }

      it 'includes the instances methods' do
        expect(klass).to respond_to(:log)
      end

      it 'includes the class methods' do
        expect(klass).to respond_to(:log)
      end
    end
  end
end
