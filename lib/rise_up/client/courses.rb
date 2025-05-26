# frozen_string_literal: true

module RiseUp
  class Client
    module Courses
      BASE = '/courses'

      def get_course(course_id)
        request(ApiResource::Course) do
          self.class.get("#{@base_uri}/#{BASE}/#{course_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end
      
      def retrieve_courses(options = {})
        request(ApiResource::Course) do
         self.class.get("#{@base_uri}/#{BASE}", {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end


      def retrieve_all_pages_courses(options={})
        retrieve_with_pagination(BASE, options, ApiResource::Course)
      end

      def create_course(options = {})
        request(ApiResource::Course) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              'Content-Type' => 'application/x-www-form-urlencoded',
                              'Authorization' => "Bearer #{access_token}"
                            }
                          })
        end
      end
    end
  end
end
