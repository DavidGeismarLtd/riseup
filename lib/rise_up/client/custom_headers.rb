# frozen_string_literal: true

module RiseUp
  class Client
    module CustomHeaders
      BASE = '/customheader'

      def create_custom_header(options = {})
        request(ApiResource::CustomHeader) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              'Authorization' => "Bearer #{access_token}",
                              'Content-Type' => 'application/json'
                            }
                          }).body
        end
      end

      def retrieve_custom_headers(options = {})
        url = options[:id] ? "#{@base_uri}/#{BASE}/#{options[:id]}" : "#{@base_uri}/#{BASE}"

        request(ApiResource::CustomHeader) do
         self.class.get(url, {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end

      # PUT: Update an existing custom header
      def update_custom_header(id, options = {})
        url = "#{@base_uri}/#{BASE}/#{id}"
        request(ApiResource::CustomHeader) do
          self.class.put(url, {
            body: options.to_json,
            headers: {
              'Authorization' => "Bearer #{access_token}",
              'Content-Type' => 'application/json'
            }
          }).body
        end
      end
      
      # DELETE: Delete a custom header
      def delete_custom_header(id)
        url = "#{@base_uri}/#{BASE}/#{id}"
        self.class.delete(url, headers: default_headers).body
      end
    end
  end
end
