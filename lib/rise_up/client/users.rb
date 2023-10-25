# frozen_string_literal: true

module RiseUp
  class Client
    module Users
      BASE = '/users'
      def create_user(options = {})
        request(ApiResource::User) do
          self.class.post(BASE, {
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
         self.class.get(BASE, {

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
         self.class.get("#{BASE}/#{id}", {
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
