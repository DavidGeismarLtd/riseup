# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingSessions
      BASE = '/trainingsessions'

      def retrieve_training_session(training_session_id)
         request(ApiResource::TrainingSession) do
           self.class.get("#{@base_uri}/#{BASE}/#{training_session_id}", {
                                       headers: {
                                         'Authorization' => "Bearer #{access_token}",
                                         'Content-Type' => 'application/json'
                                       }
                                     })
         end
      end

      def retrieve_all_pages_training_sessions(options={})
        retrieve_with_pagination(BASE, options, ApiResource::TrainingSession)
      end

      def retrieve_training_sessions(options = {})
        request(ApiResource::TrainingSession) do
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
