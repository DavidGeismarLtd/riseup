# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingCategories
      BASE = '/trainingcategories'

      def retrieve_training_categories(options = {})
        request(ApiResource::TrainingCategory) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end

      alias_method :retrieve_categories, :retrieve_training_categories
    end
  end
end
