# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingPathSubscriptions
      BASE = '/trainingpathsubscriptions'
      def create_training_path_subscription(user_id, training_path_id)
        request(ApiResource::TrainingPathSubscription) do
          self.class.post(BASE, {
                            body: options.merge(iduser: user_id, idpath: training_path_id).to_json,
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
