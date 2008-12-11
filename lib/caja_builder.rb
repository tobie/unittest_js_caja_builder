$:.unshift File.expand_path(File.dirname(__FILE__))

require 'caja_builder/assets_handler'
require 'caja_builder/gadget_builder'
require 'caja_builder/container_builder'
require 'caja_builder/suite_builder'
require 'caja_builder/cajoled_builder_options'
require 'caja_builder/cajoler'
require 'caja_builder/cajoling_error'
require 'caja_builder/template'

module UnittestJS
  module CajaBuilder
    CAJA_FILENAMES = %w[cajita cajita-debugmode log-to-console].freeze
  
    CAJA_PLUGIN_FILENAMES = %w[bridal unicode html4-defs css-defs
      html-sanitizer html-emitter domita valija.co].freeze
  end
end
