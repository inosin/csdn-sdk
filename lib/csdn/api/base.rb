require 'hashie'
require 'json'

module CsdnOAuth2
  module Api
    class Base
      extend Forwardable

      def_delegators :@access_token, :get, :post, :put, :delete

      @@API_VERSION = 1

      def initialize(access_token)
        @access_token = access_token
      end

      def hashie(response)
        json_body = MultiJson.load(response.body)
        if json_body.is_a? Array
          Array.new(json_body.count){|i| Hashie::Mash.new(json_body[i])}
        else
          Hashie::Mash.new json_body
        end
      end

    end
  end
end