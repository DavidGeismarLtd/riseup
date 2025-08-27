# frozen_string_literal: true

module RiseUp
  class Client
    module LearningPaths
      BASE = '/learningpaths'


      def retrieve_learning_path(learning_path_id, options={})
        request(ApiResource::LearningPath) do
         self.class.get("#{@base_uri}/#{BASE}/#{group_id}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end
      
      def retrieve_learning_paths(options = {})
        request(ApiResource::LearningPath) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end

      def retrieve_all_pages_learning_paths(options={})
        retrieve_with_pagination(BASE, options, ApiResource::LearningPath)
      end

      def create_learning_paths(options = {})
        request(ApiResource::LearningPath) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
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
