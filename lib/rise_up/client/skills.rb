# frozen_string_literal: true

module RiseUp
  class Client
    module Skills
      BASE = '/skills'

      def retrieve_skills(options = {})
        request(ApiResource::Skill) do
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
