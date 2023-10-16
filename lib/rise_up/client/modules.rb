# frozen_string_literal: true

module RiseUp
  class Client
    module Modules
      BASE = '/modules'

      def create_module(options={})
        request(ApiResource::Module) do
          self.class.post(BASE, {
              query: options,
              headers: {
                'Authorization' => "Bearer #{access_token}",
                'Content-Type' => 'application/json'
              }
            }).body
          end
        end
      end

      def retrieve_modules(options = {})
        request(ApiResource::Module) do
         self.class.get(BASE, {
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
