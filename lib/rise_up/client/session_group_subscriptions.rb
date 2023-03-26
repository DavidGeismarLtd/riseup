module RiseUp
  class Client
    module SessionGroupSubscriptions
      BASE = '/sessiongroupsubscriptions'

      def retrieve_session_group_subscriptions(options = {})
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
