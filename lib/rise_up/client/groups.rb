# frozen_string_literal: true

module RiseUp
  class Client
    module Groups
      BASE = '/groups'

      def register_users_to_group(group_id, users=[])
        self.class.post("#{BASE}/#{group_id}/subscribe", {
                          body: users.to_query,
                          headers: {
                            'Authorization' => "Bearer #{access_token}",
                            'Content-Type' => 'application/x-www-form-urlencoded'
                          }
                        }).body
      end

      def retrieve_groups
        request(ApiResource::Group) do
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
