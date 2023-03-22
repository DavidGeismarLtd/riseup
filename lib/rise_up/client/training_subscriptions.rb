# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingSubscriptions
      BASE = '/trainingsubscriptions'
      def create_training_subscription(user_id, training_id, options = {})
        request(ApiResource::TrainingSubscription) do
          self.class.post(BASE, {
                            body: options.merge(iduser: user_id, idtraining: training_id).to_json,
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
