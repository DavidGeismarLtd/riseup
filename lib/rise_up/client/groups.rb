# frozen_string_literal: true

module RiseUp
  class Client
    module Groups
      BASE = '/groups'

      def retrieve_groups
        request(ApiResource::Group) do
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
