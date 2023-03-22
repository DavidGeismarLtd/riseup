# frozen_string_literal: true

module RiseUp
  class Client
    module Modules
      BASE = '/modules'

      def retrieve_modules
        request(ApiResource::Module) do
         self.class.get(BASE, {
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
