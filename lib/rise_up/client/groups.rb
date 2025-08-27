# frozen_string_literal: true

module RiseUp
  class Client
    module Groups
      BASE = '/groups'

      def register_users_to_group(group_id, users=[])
        request(ApiResource::User) do
          self.class.post("#{@base_uri}/#{BASE}/#{group_id}/subscribe", {
                            body: users.to_json,
                            headers: {
                              'Authorization' => "Bearer #{access_token}",
                              'Content-Type' => 'application/json'
                            }
                          })
        end
      end

      def register_users_to_group(group_id,options = {})
        request(ApiResource::User) do
          self.class.post("#{@base_uri}/#{BASE}/#{group_id}/subscribe", {
            body: options.to_json,
            headers: {
              'Authorization' => "Bearer #{access_token}",
              'Content-Type' => 'application/json'
            }
          })
        end
      end

      def unregister_users_to_group(group_id, users = [])
        request(ApiResource::User) do
          self.class.post("#{@base_uri}/#{BASE}/#{group_id}/unsubscribe", {
            body: users.to_json,
            headers: {
              'Authorization' => "Bearer #{access_token}",
              'Content-Type' => 'application/json'
            }
          })
        end
      end

      def retrieve_all_pages_groups(options={})
        retrieve_with_pagination(BASE, options, ApiResource::Group)
      end

      def retrieve_group(group_id, options={})
        request(ApiResource::CourseRegistration) do
         self.class.get("#{@base_uri}/#{BASE}/#{group_id}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end

      def retrieve_groups(options = {})
        request(ApiResource::Group) do
         self.class.get("#{@base_uri}/#{BASE}", {
                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end
    end
  end
end
