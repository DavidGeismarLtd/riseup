# frozen_string_literal: true

module RiseUp
  class Client
    module Authentication
      BASE = '/oauth/token'

      def authenticate
         response = self.class.post(BASE, {
                                      body: { grant_type: "client_credentials" }.to_query,
                                      headers: {
                                        'Authorization' => "Basic #{authorization_base_64}",
                                        'Content-Type' => 'application/x-www-form-urlencoded'
                                      }
                                    })

         response = JSON.parse(response.body)
         self.access_token_details = response
         response
       end
    end
  end
end
