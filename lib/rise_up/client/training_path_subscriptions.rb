# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingPathSubscriptions
      BASE = '/trainingpathsubscriptions'
      def create_training_path_subscription(user_id, training_path_id)
        request(TrainingPathSubscription) do
          self.class.post(BASE, {
                            body: options.merge(iduser: user_id, idpath: training_path_id).to_query,
                            headers: {
                              'Authorization' => "Bearer #{access_token}",
                              'Content-Type' => 'application/x-www-form-urlencoded'
                            }
                          }).body
        end
      end
    end
  end
end
