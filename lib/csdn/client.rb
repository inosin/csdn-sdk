require 'oauth2'

module CsdnOAuth2
  class Client < OAuth2::Client

    def initialize(client_id='', client_secret='', opts={}, &block)
      client_id = CsdnOAuth2::Config.api_key if client_id.empty?
      client_secret = CsdnOAuth2::Config.api_secret if client_secret.empty?
      super
      @site = "http://newapi.csdn.net/"
      @options[:authorize_url] = '/oauth2/authorize'
      @options[:token_url] = '/oauth2/access_token'
    end

    def authorize_url(params={})
      params[:client_id] = @id unless params[:client_id]
      params[:response_type] = 'code' unless params[:response_type]
      params[:redirect_uri] = CsdnOAuth2::Config.redirect_uri unless params[:redirect_uri]
      super
    end

    def get_token(params, access_token_opts={})
      params = params.merge({:parse => :json})
      access_token_opts = access_token_opts.merge({:mode => :query})
      super
    end

    def get_and_restore_token(params, access_token_opts={})
      @access_token = get_token(params, access_token_opts={})
    end

    def get_token_from_hash(hash)
      access_token = hash.delete(:access_token) || hash.delete('access_token')
      @access_token = CsdnOAuth2::AccessToken.new( self, access_token, hash.merge(:mode => :query) )
    end

    def authorized?
      @access_token && @access_token.validated?
    end

    def account
      @account ||= CsdnOAuth2::Api::Account.new(@access_token) if @access_token
    end

    def blog
      @blog ||= CsdnOAuth2::Api::Blog.new(@access_token) if @access_token
    end

    def auth_code
      @auth_code ||= CsdnOAuth2::Strategy::AuthCode.new(self)
    end

  end 
end
