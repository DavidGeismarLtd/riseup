# frozen_string_literal: true

module RiseUp
  class Client
    module Modules
      BASE = '/modules'

      def create_module(options={})
        request(ApiResource::Module) do
          self.class.post("#{@base_uri}/#{BASE}", {
            query: options,
            headers: {
              'Authorization' => "Bearer #{access_token}",
              'Content-Type' => 'application/json'
            }
          }).body
        end
      end


      def retrieve_all_pages_modules(options={})
        retrieve_with_pagination(BASE, options, ApiResource::Module)
      end

      def retrieve_modules(options = {})
        request(ApiResource::Module) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end
    end
  end
end
