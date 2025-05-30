# frozen_string_literal: true

module RiseUp
  class Client
    module Documents
      BASE = '/documents'

      def get_document(document_id)
        request(ApiResource::Document) do
          self.class.get("#{@base_uri}/#{BASE}/#{document_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end
      
      def retrieve_documents(options = {})
        request(ApiResource::Document) do
         self.class.get("#{@base_uri}/#{BASE}", {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end


      def retrieve_all_pages_documents(options={})
        retrieve_with_pagination(BASE, options, ApiResource::Document)
      end

      def create_document(options = {})
        request(ApiResource::Document) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              'Content-Type' => 'application/x-www-form-urlencoded',
                              'Authorization' => "Bearer #{access_token}"
                            }
                          })
        end
      end
    end
  end
end
