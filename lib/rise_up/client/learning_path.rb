# frozen_string_literal: true

module RiseUp
  class Client
    module LearningPaths
      BASE = '/learningpaths'

      def retrieve_learning_paths(options = {})
        request(ApiResource::LearningPath) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end

      def create_learning_paths(options = {})
        request(ApiResource::LearningPath) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
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
