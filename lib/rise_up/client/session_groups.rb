# frozen_string_literal: true

module RiseUp
  class Client
    module SessionGroups
      BASE = '/sessiongroups'

      def get_session_group(session_group_id)
         request(ApiResource::SessionGroup) do
           self.class.get("#{BASE}/#{session_group_id}", {
                                       headers: {
                                         'Authorization' => "Bearer #{access_token}",
                                         'Content-Type' => 'application/json'
                                       }
                                     }).body
         end
      end

      def retrieve_session_groups(options = {})
        request(ApiResource::SessionGroup) do
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
