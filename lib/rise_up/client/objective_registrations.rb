# frozen_string_literal: true

module RiseUp
  class Client
    module ObjectiveRegistrations
      BASE = '/objectiveregistrations'

      def get_objective_registration(objective_id)
        request(ApiResource::ObjectiveRegistration) do
          self.class.get("#{@base_uri}/#{BASE}/#{objective_registration_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end
      
      def retrieve_objective_registrations(options = {})
        request(ApiResource::ObjectiveRegistration) do
         self.class.get("#{@base_uri}/#{BASE}", {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end


      def retrieve_all_pages_objective_registrations(options={})
        retrieve_with_pagination(BASE, options, ApiResource::objectiveRegistration)
      end

      def create_objective_registration(options = {})
        request(ApiResource::objectiveRegistration) do
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
