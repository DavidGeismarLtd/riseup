# frozen_string_literal: true

module RiseUp
  class Client
    module ObjectiveLevelUsers
      BASE = '/objectivelevelusers'

      def get_objective_level_user(objective_level_user_id)
        request(ApiResource::ObjectiveLevelUser) do
          self.class.get("#{@base_uri}/#{BASE}/#{objective_level_user_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end
      
      def retrieve_objective_level_users(options = {})
        request(ApiResource::ObjectiveLevelUser) do
         self.class.get("#{@base_uri}/#{BASE}", {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end


      def retrieve_all_pages_objective_level_users(options={})
        retrieve_with_pagination(BASE, options, ApiResource::objectiveLevelUser)
      end

      def create_objective_level_user(options = {})
        request(ApiResource::objectiveLevelUser) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              'Content-Type' => 'application/x-www-form-urlencoded',
                              'Authorization' => "Bearer #{access_token}"
                            }
                          })
        end
      end
    end
  end
end
