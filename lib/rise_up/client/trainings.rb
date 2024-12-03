# frozen_string_literal: true

module RiseUp
  class Client
    module Trainings
      BASE = '/trainings'

      def get_training(training_id)
        request(ApiResource::Training) do
          self.class.get("#{@base_uri}/#{BASE}/#{training_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end
      
      def retrieve_trainings(options = {})
        request(ApiResource::Training) do
         self.class.get("#{@base_uri}/#{BASE}", {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end


      def retrieve_all_pages_trainings(options={})
        retrieve_with_pagination(BASE, options, ApiResource::Training)
      end

      def create_training(options = {})
        request(ApiResource::Training) do
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
