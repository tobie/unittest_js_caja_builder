module UnittestJS
  module CajaBuilder
    class GadgetBuilder < UnittestJS::Builder::TestBuilder

      def cajole
        Cajoler.new(@options).render(rendered_file, cajoled_file, log_file)
      end
      
      def template
        @options.gadget_template
      end

      def log_filename
        to_filename(name, short_template_name, :txt)
      end

      def log_file
        @options.logs_dir.join(log_filename)
      end

      def cajoled_filename
        to_filename(name, short_template_name, 'cajoled', 'gadget', :js)
      end

      def cajoled_file
        @options.output_dir.join(cajoled_filename)
      end
      
      def rendered_filename
        to_filename(name, short_template_name, 'gadget', :html)
      end

      private
        def short_template_name
          template.name == 'caja_gadget' ? '' : template.name.sub('_gadget', '')
        end
    end
  end
end
