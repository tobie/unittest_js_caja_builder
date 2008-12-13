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
      
      PREFIX = 'unittest_js_'
      
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
      
      def transport
        content = %w[tests assertions failures errors].map { |id| hidden_input(id) }.join("\n")
        iframe << form(content)
      end
      
      private
        def short_template_name
          template_name == 'caja_container' ? '' : template_name.sub('_container', '')
        end
        
        def hidden_input(id)
          "<input id=\"#{PREFIX}#{id}\" name=\"#{PREFIX}#{id}\" type=\"hidden\" value=\"0\" />"
        end
        
        def form(content)
          %[<form id="#{PREFIX}transport_form" action="/results"
            accept-charset="utf-8" method="post" target="#{PREFIX}transport">
              #{content}
            </form>
          ]
        end
        
        def iframe
          %[<iframe id="#{PREFIX}transport" name="#{PREFIX}transport"
              src="" scrolling="no" frameborder="0"
              style="border: 0px; width: 0px; height: 0px">
            </iframe>
            ]
        end
    end
  end
end
