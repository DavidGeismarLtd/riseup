# frozen_string_literal: true

module RiseUp
  class Client
    module SessionGroups
      BASE = '/trainingsessions'

      def get_session_group(session_group_id)
         request(ApiResource::SessionGroup) do
           self.class.get("#{@base_uri}/#{BASE}/#{session_group_id}", {
                                       headers: {
                                         'Authorization' => "Bearer #{access_token}",
                                         'Content-Type' => 'application/json'
                                       }
                                     })
         end
      end

      def retrieve_all_pages_session_groups(options={})
        retrieve_with_pagination(BASE, options, ApiResource::SessionGroup)
      end

      def retrieve_session_groups(options = {})
        request(ApiResource::SessionGroup) do
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
