require 'twitter_search'

module Gateway
    class Twitter
        CLIENT_NAME = "althea"
        
        def initialize
            @client = TwitterSearch::Client.new CLIENT_NAME
            @long_url_gateway = LongURL.new
        end
        
        def search(keyword)
            tweets_with_links = keyword + " filter:links"
            tweets = @client.query :q => tweets_with_links
            parse(tweets)
        end
        
        def parse(tweets)
            tweets_with_videos = []
            tweets.each do |tweet|
               link = get_link(tweet.text)
               full_url = @long_url_gateway.expand(link)
               tweets_with_videos << Tweet.new(tweet.from_user, tweet.text, full_url) if(is_video?(full_url))   
            end
            tweets_with_videos
        end
        
        def get_link(tweet_text)
            url_regexp = /http:\/\/\w/
            url = tweet_text.split.grep(url_regexp)
            url.first
        end
        
        def is_video?(url)
            url =~ /youtube/  
        end
    end
end