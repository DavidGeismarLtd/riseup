# frozen_string_literal: true

module RiseUp
  class Client
    module Sessions
      BASE = '/sessions'

      def get_session(session_id)
         request(ApiResource::Session) do
           self.class.get("#{@base_uri}/#{BASE}/#{session_id}", {
                                       headers: {
                                         'Authorization' => "Bearer #{access_token}",
                                         'Content-Type' => 'application/json'
                                       }
                                     }).body
         end
      end

      def retrieve_all_pages_sessions(options={})
        retrieve_with_pagination(BASE, options, ApiResource::Session)
      end

      def retrieve_sessions(options = {})
        request(ApiResource::Session) do
         self.class.get("#{@base_uri}/#{BASE}", {
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
