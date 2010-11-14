require 'cgi'

module Gateway
    class Youtube
        DEVELOPER_KEY = "AI39si7JjLiwreKlHp_skHcs9RM2TwXiTSopdRCD8u6mhBmtwrwa06ccpnDWuBbpypciqfOVA6pV1RuTqfqtazjIbiKeODlpfg"
        GDATA_URL = "http://gdata.youtube.com/feeds/api/videos/"
        
        def initialize
            @client = GData::Client::YouTube.new
            @client.developer_key = DEVELOPER_KEY
        end
        
        def content_for(video_url)
            video_id = id_from_url(video_url)
            feed = @client.get(GDATA_URL + video_id).to_xml
            title = feed.elements["title"].text
            description = feed.elements["media:group/media:description"].text
            thumbnail = feed.elements["media:group/media:thumbnail"].attributes["url"]
            YoutubeVideo.new(title, thumbnail, description, video_id)
        end
        
        def id_from_url(video_url)
            uri = URI.parse(video_url)
            query_params = CGI::parse(uri.query)
            query_params["v"].first
        end
        
    end
end
