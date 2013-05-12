module CsdnOAuth2
  module Api
    class Account < Base

      #read interfaces
      def get_email
        hashie get("user/getemail")
      end

      def get_info
        hashie get("user/getinfo")
      end

      def get_mobile
        hashie get("user/getmobile")
      end

      def get_avatar(opt={})
        hashie get("user/getavatar", :params => opt)
      end

    end
  end
end