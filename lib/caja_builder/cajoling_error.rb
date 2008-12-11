module UnittestJS
  module CajaBuilder
    class CajolingError < StandardError
      ERRORS = ['FATAL_ERROR', 'ERROR', 'Exception', 'Unrecognized option']

      def initialize(log)
        @log = log
        super(select(ERRORS).join)
      end

      def select(type)
        if type.is_a?(Array)
          messages.select { |m| type.find { |t| m.include?(t) }}
        else
          messages.select { |m| m.include?(type) }
        end
      end

      private
        def messages
          content = []
          buffer = nil
          File.open(@log).each do |l|
            if l =~ /^\S/
              content << buffer if buffer
              buffer = l
            else
              buffer << l
            end
          end
          content << buffer
        end
    end
  end
end

