Note: I got a lot of inspiration from [this gem](https://github.com/simsicon/weibo_2). Thanks simsicon.

# CsdnOAuth2

CsdnOAuth2 is a Ruby gem that provides a wrapper for interacting with CSDN [API](http://open.csdn.net/wiki/apis), which is currently the latest version. Check out the link if you are interested in browsing the details. The output data format is Hashie::Mash, check out [here](https://github.com/intridea/hashie#mash). If you are not familiar with oauth2, I recommend that you read this [article](http://open.csdn.net/wiki/oauth2).

## Requirements

1.  csdn account
2.  csdn app API key
3.  csdn app API secret

## Installation

```bash
$ gem install csdn-sdk
```

## Basic Usage


1.  How to get the token?

    OAuth2 is simpler than its first version. In order to get the access token, you first need to get an Authorization Code through a callback request. Now use the following code to get the token.

    ```ruby
    CsdnOAuth2::Config.api_key = YOUR_KEY
    CsdnOAuth2::Config.api_secret = YOUR_SECRET
    CsdnOAuth2::Config.redirect_uri = YOUR_CALLBACK_URL   
    ```

    If you are developing in your localhost, you can set YOUR_CALLBACK_URL as 'http://127.0.0.1/callback' something. Then set your csdn app account's callback URL as this URL too. Csdn will call the URL using GET method, which will then enable you to retrieve the authorization code.
    
    ```ruby
    client = CsdnOAuth2::Client.new  
    ```
    
    Or you can pass the key and secret to new a client if you did not set CsdnOAuth2::Config
    
    Redirect to this URL. If user grants you permission, then you will get the authorization code.
    
    ```ruby
    client.authorize_url
    ```
    
    In your callback handling method, you should add something like the following, 
    
    ```ruby
    client.auth_code.get_token(params[:code])
    ```
    
    which will give permission to your client.
    
2.  How to get a blog info and reply it? (or call other interfaces)
    
    get a blog's info and reply it
        
    ```ruby
    client.blog.get_article(params[:article_id])
    client.blog.postcomment(params[:article_id], params[:content])
    ```
    
    Simply get a user's info.
        
    ```ruby
    client.account.get_info
    ```

