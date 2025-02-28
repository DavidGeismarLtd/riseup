# frozen_string_literal: true

module RiseUp
  class Client
    module Partners
      BASE = '/partners'

      def get_partner(partner_id)
        request(ApiResource::Partner) do
          self.class.get("#{@base_uri}/#{BASE}/#{partner_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
     end

      def retrieve_all_pages_partners(options={})
        retrieve_with_pagination(BASE, options, ApiResource::Partner)
      end

      def retrieve_partners(options = {})
        request(ApiResource::Partner) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end
    end
  end
end
