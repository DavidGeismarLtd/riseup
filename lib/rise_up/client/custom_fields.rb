# frozen_string_literal: true

module RiseUp
  class Client
    module CustomFields
      BASE = '/customfields'

      def retrieve_custom_fields
        request(ApiResource::CustomField) do
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
