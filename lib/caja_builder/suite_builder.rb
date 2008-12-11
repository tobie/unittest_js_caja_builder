module UnittestJS
  module CajaBuilder
    class SuiteBuilder < UnittestJS::Builder::SuiteBuilder
      def initialize(options = {})
        @options = BuilderOptions.new(options)
      end
      
      def render
        @options.logs_dir.mk_and_stamp!
        super
      end
      
      def assets_handler
        @assets_handler ||= AssetsHandler.new(@options)
      end
      
      private
        def all_tests
          @all_tests ||= Dir[@options.input_dir.join(@options.test_file_pattern)].map do |file|
            ContainerBuilder.new(file, @options)
          end
        end
    end
  end
end

