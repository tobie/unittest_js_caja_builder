module UnittestJS
  module CajaBuilder
    class Template < UnittestJS::Builder::Template
      TEMPLATES_DIR = DirPathname.new(File.dirname(__FILE__), '..', '..', TEMPLATES)
      
      def self.default_dir
        TEMPLATES_DIR
      end
    end
  end
end
