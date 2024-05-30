# frozen_string_literal: true

module RiseUp
  class Client
    module Users
      BASE = '/users'
      def create_user(options = {})
        request(ApiResource::User) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              'Authorization' => "Bearer #{access_token}",
                              'Content-Type' => 'application/json'
                            }
                          }).body
        end
      end


      def retrieve_users(options = {})
        request(ApiResource::User) do
         self.class.get("#{@base_uri}/#{BASE}", {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end

      def get_user(id)
       request(ApiResource::User) do
         self.class.get("#{@base_uri}/#{BASE}/#{id}", {
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
