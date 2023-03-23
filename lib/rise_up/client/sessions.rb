# frozen_string_literal: true

module RiseUp
  class Client
    module Sessions
      BASE = '/sessions'

      def get_session(session_id)
         request(ApiResource::Session) do
           self.class.get("#{BASE}/#{session_id}", {
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     }).body
         end
      end

      def retrieve_sessions
        request(ApiResource::Session) do
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
