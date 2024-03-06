require 'httparty'
require 'rise_up/api_resource/resource'
require 'rise_up/api_resource/user'
require 'rise_up/api_resource/training_subscription'
require 'rise_up/api_resource/training_path_subscription'
require 'rise_up/api_resource/training'
require 'rise_up/api_resource/training_path'
require 'rise_up/api_resource/session'
require 'rise_up/api_resource/module'
require 'rise_up/api_resource/group'
require 'rise_up/api_resource/session_group_subscription'
require 'rise_up/api_resource/custom_field'
require 'rise_up/api_resource/skill'
require 'rise_up/api_resource/training_category'
require 'rise_up/api_resource/session_group'
require 'rise_up/client/users'
require 'rise_up/client/sessions'
require 'rise_up/client/skills'
require 'rise_up/client/trainings'
require 'rise_up/client/training_paths'
require 'rise_up/client/training_path_subscriptions'
require 'rise_up/client/session_groups'
require 'rise_up/client/authentication'
require 'rise_up/client/session_group_subscriptions'
require 'rise_up/client/training_subscriptions'
require 'rise_up/client/modules'
require 'rise_up/client/groups'
require 'rise_up/client/custom_fields'
require 'rise_up/client/training_categories'
module RiseUp
  class ExpiredTokenError < StandardError; end
  class ApiResponseError < StandardError; end
  class Client
    include HTTParty
    include RiseUp::Client::Users
    include RiseUp::Client::Authentication
    include RiseUp::Client::TrainingSubscriptions
    include RiseUp::Client::TrainingPathSubscriptions
    include RiseUp::Client::Trainings
    include RiseUp::Client::TrainingPaths
    include RiseUp::Client::SessionGroups
    include RiseUp::Client::SessionGroupSubscriptions
    include RiseUp::Client::Sessions
    include RiseUp::Client::Groups
    include RiseUp::Client::CustomFields
    include RiseUp::Client::Modules
    include RiseUp::Client::Skills
    include RiseUp::Client::TrainingCategories
    attr_accessor :public_key, :private_key, :authorization_base_64, :access_token_details, :access_token, :token_storage
    base_uri 'https://api.riseup.ai/v3'

     def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    def init!
      self.authorization_base_64 = Base64.strict_encode64("#{public_key}:#{private_key}")
      self
    end

# "1ef7a484f8e4e76ed9c0c7bc6af1b08ef5cb045f"
    def request(resource = nil)
      max_retries = 2
      retries = 0

      begin
        parsed_response = JSON.parse(yield)
        handle_errors(parsed_response)

        case parsed_response
        when Array
          handle_array_response(parsed_response, resource)
        when Hash
          handle_hash_response(parsed_response, resource)
        else
          parsed_response
        end
      rescue RuntimeError => e
        if should_retry?(e, retries, max_retries)
          retries += 1
          retry
        else
          raise e
        end
      end
    end

    private
    def handle_errors(response)
      return unless response.is_a?(Hash)

      return unless response['error']
  
      if response['error']  
        if response['error'] == "expired_token" || absent_token?(response['error']  )
          refresh_access_token
          raise 'Token refreshed. Retrying request.'
        else
          raise(ApiResponseError, "#{response['error']} - #{response['error_description']}")
        end
      end
    end

    def absent_token?(error)
      error == 'invalid_request' && self.access_token.nil?
    end

    def handle_array_response(response, resource)
      response.map{ |item| resource.new(item) } if resource
    end

    def handle_hash_response(response, resource)
      resource.new(response) if resource
    end

    def should_retry?(exception, retries, max_retries)
      exception.message == 'Token refreshed. Retrying request.' && retries < max_retries
    end
  end
end
