# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingPaths
      BASE = '/trainingpaths'

      def retrieve_training_paths
        request(TrainingPath) do
         self.class.get(BASE, {
                                     headers: {
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end

      def create_training_paths(options = {})
        request(TrainingPath) do
          self.class.post(BASE, {
                            body: options.to_query,
                            headers: {
                              'Content-Type' => 'application/x-www-form-urlencoded'
                            }
                          }).body
        end
      end
    end
  end
end
