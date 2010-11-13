class HomeController < ApplicationController
   
   def search
      @keyword = params[:keyword]
      return if @keyword.blank?
      twitter_gateway = Gateway::Twitter.new
      @tweets = twitter_gateway.search(@keyword)
   end
end