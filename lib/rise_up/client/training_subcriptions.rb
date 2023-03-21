# frozen_string_literal: true

module RiseUp
  class Client
    module Users
      BASE = '/trainingsubscriptions'
      def create_training_subscription(training_id, user_id)
        request(TrainingSubscription) do
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
