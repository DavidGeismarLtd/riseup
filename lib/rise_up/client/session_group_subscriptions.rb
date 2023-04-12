module RiseUp
  class Client
    module SessionGroupSubscriptions
      BASE = '/sessiongroupsubscriptions'

      def create_session_group_subscription(user_id, session_group_id, options = {})
        request(ApiResource::SessionGroupSubscription) do
          self.class.post(BASE, {
                            body: options.merge(iduser: user_id, idsessiongroup: session_group_id).to_json,
                            headers: {
                              'Authorization' => "Bearer #{access_token}",
                              'Content-Type' => 'application/json'
                            }
                          }).body
        end
      end

      def delete_session_group_subscription(session_group_subscription_id)
        self.class.delete("#{BASE}/#{session_group_subscription_id}", {
                          headers: {
                            'Authorization' => "Bearer #{access_token}",
                            'Content-Type' => 'application/json'
                          }
                        }).body
      end

      def retrieve_session_group_subscriptions(options = {})
        request(ApiResource::SessionGroupSubscription) do
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
