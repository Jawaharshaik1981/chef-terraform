require 'spec_helper'

module Logify
  describe Logger do
    let(:io)     { StringIO.new }
    let(:klass)  { Class.new { include Logify } }
    let(:log)    { klass.new.log }
    let(:stdout) { io.rewind && io.read }

    before do
      Logify.level = :debug
      Logify.io = io
    end

    it 'accepts a string parameter' do
      expect { log.debug 'An informative message' }.to_not raise_error
      expect(stdout).to include('An informative message')
    end

    it 'accepts a block parameter' do
      expect {
        log.debug { String.new('An informative message') }
      }.to_not raise_error
      expect(stdout).to include('An informative message')
    end

    context 'when the log level is :debug' do
      it 'pretty aligns parameters' do
        log.info  'Starting some command...'
        log.debug 'x = 0'
        log.debug 'y = 99'
        log.warn  'x is 0'
        log.error 'Cannot divide by 0'
        log.fatal 'Ruby segfaulted'


        expect(stdout).to include('| ===> Starting some command...')
        expect(stdout).to include('|      x = 0')
        expect(stdout).to include('|      y = 99')
        expect(stdout).to include('| **** x is 0')
        expect(stdout).to include('| >>>> Cannot divide by 0')
        expect(stdout).to include('| !!!! Ruby segfaulted')
      end

      context 'when the class is < MAX_LENGTH' do
        it 'uses the full class name' do
          klass.stub(:name).and_return('Hello::Kitty')
          log.debug 'Helpful info'

          expect(stdout).to include('Hello::Kitty |      Helpful info')
        end
      end

      context 'when the class is MAX_LENGTH' do
        it 'uses the full class name' do
          klass.stub(:name).and_return('Hello::Kitty::Magical::Pony::Eye')
          log.debug 'Helpful info'

          expect(stdout).to include('Hello::Kitty::Magical::Pony::Eye |      Helpful info')
        end
      end

      context 'when the class is > MAX_LENGTH' do
        it 'shortens the name by namespace' do
          klass.stub(:name).and_return('Hello::Kitty::Magical::Ponies::Eye')
          log.debug 'Helpful info'

          expect(stdout).to include('Kitty::Magical::Ponies::Eye |      Helpful info')
        end

        it 'just pre-truncates long names' do
          klass.stub(:name).and_return('ReallyLongHelloKittyMagicalPoniesEye')
          log.debug 'Helpful info'

          expect(stdout).to include('gHelloKittyMagicalPoniesEye |      Helpful info')
        end
      end
    end

    context 'when the log level is not :debug' do
      before { Logify.level = :info }

      it 'uses the shortened syntax' do
        log.info  'Starting some command...'
        log.debug 'x = 0'
        log.debug 'y = 99'
        log.warn  'x is 0'
        log.error 'Cannot divide by 0'
        log.fatal 'Ruby segfaulted'


        expect(stdout).to include('I: Starting some command')
        expect(stdout).to include('W: x is 0')
        expect(stdout).to include('E: Cannot divide by 0')
        expect(stdout).to include('F: Ruby segfaulted')
      end
    end

    context 'when the log level is :info' do
      before { Logify.level = :info }

      it 'does not print :debug messages' do
        log.debug 'This is a debug'
        expect(stdout).to_not include('This is a debug')
      end

      it 'prints :info messages' do
        log.info 'This is info'
        expect(stdout).to include('This is info')
      end

      it 'prints :warn messages' do
        log.warn 'This is a warn'
        expect(stdout).to include('This is a warn')
      end

      it 'prints :error messages' do
        log.error 'This is an error'
        expect(stdout).to include('This is an error')
      end

      it 'prints :fatal messages' do
        log.fatal 'This is a fatal'
        expect(stdout).to include('This is a fatal')
      end
    end

    context 'when the log level is :warn' do
      before { Logify.level = :warn }

      it 'does not print :debug messages' do
        log.debug 'This is a debug'
        expect(stdout).to_not include('This is a debug')
      end

      it 'does not print :info messages' do
        log.info 'This is info'
        expect(stdout).to_not include('This is info')
      end

      it 'prints :warn messages' do
        log.warn 'This is a warn'
        expect(stdout).to include('This is a warn')
      end

      it 'prints :error messages' do
        log.error 'This is an error'
        expect(stdout).to include('This is an error')
      end

      it 'prints :fatal messages' do
        log.fatal 'This is a fatal'
        expect(stdout).to include('This is a fatal')
      end
    end

    context 'when the log level is :error' do
      before { Logify.level = :error }

      it 'does not print :debug messages' do
        log.debug 'This is a debug'
        expect(stdout).to_not include('This is a debug')
      end

      it 'does not print :info messages' do
        log.info 'This is info'
        expect(stdout).to_not include('This is info')
      end

      it 'does not print :warn messages' do
        log.warn 'This is a warn'
        expect(stdout).to_not include('This is a warn')
      end

      it 'prints :error messages' do
        log.error 'This is an error'
        expect(stdout).to include('This is an error')
      end

      it 'prints :fatal messages' do
        log.fatal 'This is a fatal'
        expect(stdout).to include('This is a fatal')
      end
    end

    context 'when the log level is :fatal' do
      before { Logify.level = :fatal }

      it 'does not print :debug messages' do
        log.debug 'This is a debug'
        expect(stdout).to_not include('This is a debug')
      end

      it 'does not print :info messages' do
        log.info 'This is info'
        expect(stdout).to_not include('This is info')
      end

      it 'does not print :warn messages' do
        log.warn 'This is a warn'
        expect(stdout).to_not include('This is a warn')
      end

      it 'does not print :error messages' do
        log.error 'This is an error'
        expect(stdout).to_not include('This is an error')
      end

      it 'prints :fatal messages' do
        log.fatal 'This is a fatal'
        expect(stdout).to include('This is a fatal')
      end
    end

    context 'when the log level is :none' do
      before { Logify.level = :none }

      it 'does not print :debug messages' do
        log.debug 'This is a debug'
        expect(stdout).to_not include('This is a debug')
      end

      it 'does not print :info messages' do
        log.info 'This is info'
        expect(stdout).to_not include('This is info')
      end

      it 'does not print :warn messages' do
        log.warn 'This is a warn'
        expect(stdout).to_not include('This is a warn')
      end

      it 'does not print :error messages' do
        log.error 'This is an error'
        expect(stdout).to_not include('This is an error')
      end

      it 'does not print :fatal messages' do
        log.fatal 'This is a fatal'
        expect(stdout).to_not include('This is a fatal')
      end
    end

    context 'with filter params' do
      before { Logify.filter('bacon') }

      it 'filters the parameter' do
        log.info 'The password is bacon'
        expect(stdout).to include('The password is [FILTERED]')
      end
    end
  end
end
