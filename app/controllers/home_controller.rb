class HomeController < ApplicationController
   
   def search
      @keyword = params[:keyword]
      return if @keyword.blank?
      twitter_gateway = Gateway::Twitter.new
      tweets = twitter_gateway.search(@keyword)
      
      youtube_gateway = Gateway::Youtube.new
      @tweets_with_videos = {}
      tweets.each do |tweet|
          video = youtube_gateway.content_for(tweet.video)
          @tweets_with_videos[tweet] = video
      end
      
   end
end