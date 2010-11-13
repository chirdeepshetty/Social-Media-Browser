require 'cgi'
require 'net/http'
require 'rexml/document'

module Gateway
    class LongURL
        URL = URI.parse("http://api.longurl.org/v2/expand")
        
        def expand(short_url)
            response = make_http_request(CGI.escape(short_url))
            parse_response(response.body)
        end
        
        def make_http_request(short_url)
            http = Net::HTTP.new(URL.host, URL.port) 
            request = Net::HTTP::Get.new(URL.path + "?url=" + short_url)
            http.request(request)
        end
        
        def parse_response(response)
            doc = REXML::Document.new(response)
            doc.elements.collect('response/long-url'){|e| e.text }.first
        end
        
    end
end
