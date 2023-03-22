# frozen_string_literal: true

module RiseUp
  class Client
    module Trainings
      BASE = '/trainings'

      def retrieve_trainings
        request(Training) do
         self.class.get(BASE, {
                                     headers: {
                                       'Content-Type' => 'application/json'
                                     }
                                   }).body
         end
      end

      def create_training(options = {})
        request(Training) do
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
