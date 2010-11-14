class YoutubeVideo
   attr_reader :title, :thumbnail, :description, :video_id
   
   def initialize(title, thumbnail, description, video_id)
       @title = title
       @thumbnail = thumbnail
       @description = description
       @video_id = video_id
   end 
end