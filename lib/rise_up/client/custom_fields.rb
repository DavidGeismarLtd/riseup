# frozen_string_literal: true

module RiseUp
  class Client
    module CustomFields
      BASE = '/customfields'

      def retrieve_custom_fields(options = {})
        request(ApiResource::CustomField) do
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
