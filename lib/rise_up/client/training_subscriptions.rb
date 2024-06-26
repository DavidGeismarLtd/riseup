# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingSubscriptions
      BASE = '/trainingsubscriptions'
      def create_training_subscription(user_id, training_id, options = {})
        request(ApiResource::TrainingSubscription) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.merge(iduser: user_id, idtraining: training_id).to_json,
                            headers: {
                              'Authorization' => "Bearer #{access_token}",
                              'Content-Type' => 'application/json'
                            }
                          }).body
        end
      end

      def delete_training_subscription(training_subscription_id)
          self.class.delete("#{@base_uri}/#{BASE}/#{training_subscription_id}", {
                            headers: {
                              'Authorization' => "Bearer #{access_token}",
                              'Content-Type' => 'application/json'
                            }
                          }).body
      end

      def retrieve_training_subscription(training_subscription_id, options={})
        request(ApiResource::TrainingSubscription) do
         self.class.get("#{@base_uri}/#{BASE}/#{training_subscription_id}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end

      def retrieve_training_subscriptions(options = {})
        request(ApiResource::TrainingSubscription) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
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
