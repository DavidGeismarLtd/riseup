# frozen_string_literal: true

module RiseUp
  class Client
    module ObjectiveLevels
      BASE = '/objectivelevels'

      def get_objective_level(objective_level_id)
        request(ApiResource::ObjectiveLevel) do
          self.class.get("#{@base_uri}/#{BASE}/#{objective_level_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end
      
      def retrieve_objective_levels(options = {})
        request(ApiResource::ObjectiveLevel) do
         self.class.get("#{@base_uri}/#{BASE}", {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end


      def retrieve_all_pages_objective_levels(options={})
        retrieve_with_pagination(BASE, options, ApiResource::objectiveLevel)
      end

      def create_objective_level(options = {})
        request(ApiResource::objectiveLevel) do
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
