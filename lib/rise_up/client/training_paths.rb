# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingPaths
      BASE = '/trainingpaths'

      def retrieve_training_paths(options = {})
        request(ApiResource::TrainingPath) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end

      def create_training_paths(options = {})
        request(ApiResource::TrainingPath) do
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
