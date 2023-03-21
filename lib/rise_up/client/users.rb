# frozen_string_literal: true

module RiseUp
  class Client
    module Users
      BASE = '/users'
      def create(user_id, training_id, options = {})
        request(User) do
          self.class.post(BASE, {
                            body: options.merge(iduser: user_id, idtraining: training_id).to_query,
                            headers: {
                              'Content-Type' => 'application/x-www-form-urlencoded'
                            }
                          }).body
        end
      end
    end
  end
end
