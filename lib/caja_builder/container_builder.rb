module UnittestJS
  module CajaBuilder
    class ContainerBuilder < UnittestJS::Builder::TestBuilder
      LIB_FILENAMES = [
        'error_handler.js',
        'cajita.js',
        'cajita-debugmode.js',
        'bridal.js',
        'log-to-console.js',
        'unicode.js',
        'html4-defs.js',
        'css-defs.js',
        'html-sanitizer.js',
        'html-emitter.js',
        'domita.js',
        'unittest_transport.js',
        'valija_loader.js',
        'valija.co.js',
        'console_importer.js'
      ].freeze
      
      def gadget
        @gadget ||= GadgetBuilder.new(file, @options)
      end

      def render
        gadget.render
        gadget.cajole
        super
      end

      def template
        @options.container_template
      end
      
      def test_file
        cajoled_file
      end
      
      def cajoled_filename
        @cajoled_filename ||= gadget.cajoled_filename
      end
      
      def cajoled_file
        to_script_tag(cajoled_filename)
      end
      
      def lib_files
        LIB_FILENAMES.map { |filename| to_script_tag("assets/#{filename}") }.join("\n")
      end

      private
        def short_template_name
          template_name == 'caja_container' ? '' : template_name.sub('_container', '')
        end
    end
  end
end
