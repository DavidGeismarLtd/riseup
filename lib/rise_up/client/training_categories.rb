# frozen_string_literal: true

module RiseUp
  class Client
    module TrainingCategories
      BASE = '/trainingcategories'

      def get_training_category(training_category_id)
        request(ApiResource::training_category) do
          self.class.get("#{@base_uri}/#{BASE}/#{training_category_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end

      def retrieve_all_pages_training_categories(options={})
        retrieve_with_pagination(BASE, options, ApiResource::TrainingCategory)
      end

      def retrieve_training_categories(options = {})
        request(ApiResource::TrainingCategory) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end

      alias_method :retrieve_categories, :retrieve_training_categories
    end
  end
end
