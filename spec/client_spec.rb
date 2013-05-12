require 'csdn-sdk'

CsdnOAuth2::Config.api_key = 'abc'
CsdnOAuth2::Config.api_secret = 'def'
CsdnOAuth2::Config.redirect_uri = 'https://example.com/callback'

describe CsdnOAuth2::Client do
  it 'should assign id and secret from config' do
    subject.id.should == 'abc'
    subject.secret.should == 'def'
  end

  it 'should assign site from default' do
    subject.site.should == 'http://newapi.csdn.net/'
  end

  it 'should get authorize_url' do
    authorize_url = 'http://newapi.csdn.net/oauth2/authorize?client_id=abc&response_type=code&redirect_uri=https%3A%2F%2Fexample.com%2Fcallback'
    subject.authorize_url.should == authorize_url
  end

  it 'should leave Faraday::Connection#ssl unset' do
    subject.connection.ssl.should == {}
  end

  it "defaults raise_errors to true" do
    subject.options[:raise_errors].should be_true
  end

  it "allows true/false for raise_errors option" do
    client = OAuth2::Client.new('abc', 'def', :site => 'https://api.example.com', :raise_errors => false)
    client.options[:raise_errors].should be_false
    client = OAuth2::Client.new('abc', 'def', :site => 'https://api.example.com', :raise_errors => true)
    client.options[:raise_errors].should be_true
  end

  it "allows get/post for access_token_method option" do
    client = OAuth2::Client.new('abc', 'def', :site => 'https://api.example.com', :access_token_method => :get)
    client.options[:access_token_method].should == :get
    client = OAuth2::Client.new('abc', 'def', :site => 'https://api.example.com', :access_token_method => :post)
    client.options[:access_token_method].should == :post
  end

end