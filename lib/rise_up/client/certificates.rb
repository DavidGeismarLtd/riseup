# frozen_string_literal: true

module RiseUp
  class Client
    module Certificates
      BASE = '/certificates'

      def delete
         response = self.class.post(BASE, {
                                      body: { grant_type: "client_credentials" }to_query,
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/x-www-form-urlencoded'
                                      }
                                    })
         JSON.parse(response.body)
       end
    end
  end
end
