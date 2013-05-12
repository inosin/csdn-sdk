module CsdnOAuth2
  module Api
    class Blog < Base

      #read interfaces
      def get_info
        hashie get("blog/getinfo")
      end

      def get_stats
        hashie get("blog/getstats")
      end

      def get_medal
        hashie get("blog/getmedal")
      end

      def get_column
        hashie get("blog/getcolumn")
      end

      def get_articlelist(opt={})
        hashie get("blog/getarticlelist", :params => opt)
      end

      def get_article(id)
        hashie get("blog/getarticle", :params => {:id => id})
      end

      def get_categorylist
        hashie get("blog/getcategorylist")
      end

      def get_taglist
        hashie get("blog/gettaglist")
      end

      def get_commentlist(opt={})
        hashie get("blog/getcommentlist", :params => opt)
      end

      def get_mycommentlist(opt={})
        hashie get("blog/getmycommentlist", :params => opt)
      end

      def get_articlecomment(id, opt={})
        hashie get("blog/getarticlecomment", :params => {:article => id}.merge(opt))
      end

      def get_newarticlelist(opt={})
        hashie get("blog/getnewarticlelist", :params => opt)
      end

      def get_homenewest(opt={})
        hashie get("blog/gethomenewest", :params => opt)
      end

      def get_expertlist(opt={})
        hashie get("blog/getexpertlist", :params => opt)
      end

      def get_columnlist(opt={})
        hashie get("blog/getcolumnlist", :params => opt)
      end

      def get_columndetails(name, opt={})
        hashie get("blog/getcolumndetails", :params => {:alias => name}.merge(opt))
      end

      def get_columnarticles(name, opt={})
        hashie get("blog/getcolumnarticles", :params => {:alias => name}.merge(opt))
      end

      #write interfaces
      def save_info(opt={})
        hashie post("blog/saveinfo", :params => opt)
      end

      def save_article(opt={})
        hashie post("blog/savearticle", :params => opt)
      end

      def postcomment(id, content, opt={})
        hashie post("blog/postcomment", :params => {:artice => id, :content => content}.mege(opt))
      end

    end
  end
end