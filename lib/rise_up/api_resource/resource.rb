# frozen_string_literal: true
require 'logger'

module RiseUp
  module ApiResource
    # base resource class
    class Resource
      def initialize(options = {})
        @logger = Logger.new(STDOUT)
        options.each do |k, v|
          if valid_attribute_name?(k)
            self.class.attr_accessor(k)
            send("#{k}=", v)
          else
            @logger.warn("Invalid attribute name `#{k}`")
          end
        end
      end

      private

      def valid_attribute_name?(name)
        name.to_s.match?(/\A[a-z_][a-zA-Z_0-9]*\z/)
      end
    end
  end
end
