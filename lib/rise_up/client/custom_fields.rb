# frozen_string_literal: true

module RiseUp
  class Client
    module CustomFields
      BASE = '/customfields'

      def retrieve_custom_fields(options = {})
        request(ApiResource::CustomField) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end

      def retrieve_all_pages_custom_fields(options={})
        retrieve_with_pagination(BASE, options, ApiResource::CustomField)
      end
    end
  end
end
