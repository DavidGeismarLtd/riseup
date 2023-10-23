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
        self.access_token = response["access_token"]
        response
      end

      def refresh_access_token
        response = authenticate
        token_storage.update(
          access_token: response["access_token"],
          acces_token_details: response
        )
      end

    end
  end
end
# curl -X POST \
#   --header "Content-Type: application/x-www-form-urlencoded" \
#   --header "Authorization: Basic NWRhMTI0ZDAzMTVkNjM4MjQwZjBjNmE3YThjN2U1OTY6MzQ3MjI3NzhmNDQ5NzNlMTc4OTVkNDY1YzNhZjdmNDI=" \
#   -d "grant_type=client_credentials" \
#   https://yunoo.riseup.ai/oauth/token