# frozen_string_literal: true

module RiseUp
  class Client
    module Skills
      BASE = '/skills'

      def get_skill(skill_id)
        request(ApiResource::Skill) do
          self.class.get("#{@base_uri}/#{BASE}/#{skill_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end

      def retrieve_all_pages_skills(options={})
        retrieve_with_pagination(BASE, options, ApiResource::Skill)
      end

      def retrieve_skills(options = {})
        request(ApiResource::Skill) do
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
