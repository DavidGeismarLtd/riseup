module RiseUp
  class Client
    module SessionSubscriptions
      BASE = '/sessionsubscriptions'

      def get_session_subscriptions(session_id)
         request(ApiResource::SessionSubscription) do
           self.class.get("#{@base_uri}/#{BASE}/#{session_id}", {
                                       headers: {
                                          'Authorization' => "Bearer #{access_token}",
                                         'Content-Type' => 'application/json'
                                       }
                                     })
         end
      end

      def retrieve_all_pages_session_subcriptions(options={})
        retrieve_with_pagination(BASE, options, ApiResource::SessionSubscription)
      end

      def retrieve_session_subcriptions(options = {})
        request(ApiResource::SessionSubscription) do
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
