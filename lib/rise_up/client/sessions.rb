# frozen_string_literal: true

module RiseUp
  class Client
    module Sessions
      BASE = '/sessions'

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
