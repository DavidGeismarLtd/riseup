# frozen_string_literal: true

module RiseUp
  class Client
    module Users
      BASE = '/users'
      def create_user(username, options = {})
        request(User) do
          self.class.post(BASE, {
                            body: options.merge(username:).to_query,
                            headers: {
                              'Authorization' => "Bearer #{access_token}",
                              'Content-Type' => 'application/x-www-form-urlencoded'
                            }
                          }).body
        end
      end

      def get_user(id)
       request(User) do
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
