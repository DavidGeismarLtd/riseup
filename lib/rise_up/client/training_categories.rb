# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingCategories
      BASE = '/trainingcategories'
      alias_method :retrieve_categories, :retrieve_training_categories,

      def retrieve_training_categories(options = {})
        request(ApiResource::TrainingCategory) do
         self.class.get(BASE, {
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
