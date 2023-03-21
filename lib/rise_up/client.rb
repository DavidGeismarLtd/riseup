require 'httparty'
require 'rise_up/resource'
require 'rise_up/user'
require 'rise_up/training_subscription'
require 'rise_up/client/users'
require 'rise_up/client/authentication'
require 'rise_up/client/training_subscriptions'
module RiseUp
  class Client
    include HTTParty
    include RiseUp::Client::Users
    include RiseUp::Client::Authentication
    include RiseUp::Client::TrainingSubscriptions
     attr_accessor :public_key, :private_key, :authorization_base_64, :access_token_details
     base_uri 'https://app.360learning.com/api/v1'

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


    def request(resource = nil)
      parsed_response = JSON.parse(yield)
      error_message = parsed_response['error'] || parsed_response['message'] if parsed_response.is_a? Hash
      raise(ApiResponseError, error_message) if error_message
      return parsed_response.map{ |item| resource.new(item) } if parsed_response.is_a?(Array) && resource
      return resource.new(parsed_response) if resource

      parsed_response
    end
  end
end
