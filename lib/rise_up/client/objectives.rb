# frozen_string_literal: true

module RiseUp
  class Client
    module Objectives
      BASE = '/objectives'

      def get_objective(objective_id)
        request(ApiResource::Objective) do
          self.class.get("#{@base_uri}/#{BASE}/#{objective_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end
      
      def retrieve_objectives(options = {})
        request(ApiResource::Objective) do
         self.class.get("#{@base_uri}/#{BASE}", {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end


      def retrieve_all_pages_objectives(options={})
        retrieve_with_pagination(BASE, options, ApiResource::objective)
      end

      def create_objective(options = {})
        request(ApiResource::objective) do
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
