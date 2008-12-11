module UnittestJS
  module CajaBuilder
    class AssetsHandler < UnittestJS::Builder::AssetsHandler
      def copy_cajoled_unittest_assets
        files = Dir[@options.cajoled_unittest_assets_dir.join('*')]
        FileUtils.cp(files, @options.output_assets_dir)
      end

      def copy_caja_plugin_assets
        CajaBuilder::CAJA_PLUGIN_FILENAMES.each do |filename|
          FileUtils.cp(caja_plugin_assets_dir.join("#{filename}.js"), @options.output_assets_dir)
        end
      end
      
      def caja_plugin_assets_dir
        @caja_plugin_assets_dir ||= @options.caja_dir.join('ant-lib', 'com', 'google', 'caja', 'plugin')
      end
      
      def copy_caja_assets
        CajaBuilder::CAJA_FILENAMES.each do |filename|
          FileUtils.cp(caja_assets_dir.join("#{filename}.js"), @options.output_assets_dir)
        end
      end
      
      def caja_assets_dir
        @caja_assets_dir ||= @options.caja_dir.join('src', 'com', 'google', 'caja')
      end

      def copy
        super
        copy_cajoled_unittest_assets
        copy_caja_plugin_assets
        copy_caja_assets
      end
    end
  end
end
