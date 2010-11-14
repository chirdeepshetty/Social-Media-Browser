class YoutubeVideo
   attr_reader :title, :thumbnail, :description
   
   def initialize(title, thumbnail, description)
       @title = title
       @thumbnail = thumbnail
       @description = description
   end 
end