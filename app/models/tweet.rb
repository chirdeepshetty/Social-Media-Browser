class Tweet
    attr_reader :user, :text, :video
    
    def initialize(user, text, video)
        @user = user
        @text = text
        @video = video
    end
end