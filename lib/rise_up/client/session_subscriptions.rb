module RiseUp
  class Client
    module SessionSubscriptions
      BASE = '/sessionsubscriptions'

      def get_session_subscriptions(session_id)
         request(ApiResource::SessionSubscription) do
           self.class.get("#{BASE}/#{session_id}", {
                                       headers: {
                                          'Authorization' => "Bearer #{access_token}",
                                         'Content-Type' => 'application/json'
                                       }
                                     }).body
         end
      end

      def retrieve_sessions(options = {})
        request(ApiResource::Session) do
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
