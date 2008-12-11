module UnittestJS
  module CajaBuilder
    class BuilderOptions < UnittestJS::Builder::BuilderOptions
      CAJA    = 'caja'
      LOGS    = 'logs'
      GADGETS = 'gadgets'

      def gadget_template
        @gadget_template ||= Template.from(@options[:gadget_template] || :caja_gadget, templates_dir)
      end

      def container_template
        @caja_container ||= Template.from(@options[:caja_container] || :caja_container, templates_dir)
      end

      def caja_dir
        if @caja_dir
          @caja_dir
        elsif @options[:caja_dir]
          @caja_dir = DirPathname.new(@options[:caja_dir])
        else
          @caja_dir = DirPathname.new(File.dirname(__FILE__), '..', '..', CAJA)
        end
      end
      
      def cajoled_unittest_assets_dir
        @cajoled_unittest_assets_dir ||= DirPathname.new(File.dirname(__FILE__), '..', '..', ASSETS)
      end

      def logs_dir
        @logs_dir ||= DirPathname.new(output_dir, @options[:logs_dir] || LOGS)
      end

      def java_heap
        @java_heap ||= "-Xmx#{@options[:java_heap] || 512}m"
      end

      def whitelist_dir
        @whitelist_dir ||= @options[:whitelist_dir]
      end

      def css_prop_schema
        @css_prop_schema ||= normalize_schema_path(@options[:css_prop_schema])
      end

      def html_attrib_schema
        @html_attrib_schema ||= normalize_schema_path(@options[:html_attrib_schema])
      end

      def html_property_schema
        @html_property_schema ||= normalize_schema_path(@options[:html_property_schema])
      end

      def valija_mode?
        @valija_mode ||= @options[:valija_mode] || true
      end

      def minify?
        @minify ||= @options[:minify] || true
      end

      private
        def normalize_schema_path(path)
          raise 'whitelist_dir option must be specified.' unless whitelist_dir
          prefix = 'resource:///'
          path ? prefix << path.sub(prefix, '') : nil
        end
    end
  end
end
