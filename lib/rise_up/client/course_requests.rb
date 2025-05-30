# frozen_string_literal: true

module RiseUp
  class Client
    module CourseRequests
      BASE = '/courserequests'

      def get_course_request(course_request_id)
        request(ApiResource::CourseRequest) do
          self.class.get("#{@base_uri}/#{BASE}/#{course_request_id}", {
                                      headers: {
                                        'Authorization' => "Bearer #{access_token}",
                                        'Content-Type' => 'application/json'
                                      }
                                    })
        end
      end
      
      def retrieve_course_requests(options = {})
        request(ApiResource::CourseRequest) do
         self.class.get("#{@base_uri}/#{BASE}", {

                                     query: options,
                                     headers: {
                                       'Authorization' => "Bearer #{access_token}",
                                       'Content-Type' => 'application/json'
                                     }
                                   })
         end
      end


      def retrieve_all_pages_course_requests(options={})
        retrieve_with_pagination(BASE, options, ApiResource::CourseRequest)
      end
    end
  end
end
