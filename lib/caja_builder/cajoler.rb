module UnittestJS
  module CajaBuilder
    class Cajoler
      def initialize(options)
        @options = options
      end

      def render(input, output, log)
        cmd = "java #{@options.java_heap} -cp #{class_path} com.google.caja.plugin.PluginCompilerMain "
        cmd << "-i #{input} "
        cmd << "-o #{output} "
        cmd << '-a ' if @options.valija_mode?
        cmd << "--css_prop_schema #{@options.css_prop_schema} "           if @options.css_prop_schema
        cmd << "--html_attrib_schema #{@options.html_attrib_schema} "     if @options.html_attrib_schema
        cmd << "--html_property_schema #{@options.html_property_schema} " if @options.html_property_schema
        cmd << "> #{log} 2>&1"
        raise CajolingError.new(log) unless system(cmd)
      end

      def minify(file)
        lines = []
        File.open(file).each { |line| lines << line.strip }
        File.open(file, 'w+') { |f| f << lines.join("\n") }
      end

      private
        def class_path
          files = jars
          files << @options.whitelist_dir if @options.whitelist_dir
          files << lang_dir.join('html')
          files << lang_dir.join('css')
          files.join(':')
        end

        def jars
          files = Dir[File.join(@options.caja_dir, 'ant-jars', '*.jar')]
          raise "caja_dir option must point to the Caja SVN trunk." if files.empty?
          files
        end

        def lang_dir
          @lang_dir ||= @options.caja_dir.join('ant-lib', 'com', 'google', 'caja', 'lang')
        end
    end
  end
end

