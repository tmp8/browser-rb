module Browser
  class Location
    
    def initialize(uri_string)
      uri = URI.parse(uri_string)
      unless uri.scheme
        uri = URI.parse("file://#{File.expand_path(uri_string)}")
      end
      
      @uri = uri
    end
    
    def href
      @uri.to_s
    end
    
    def search
      ''
    end
    
    def protocol
      "#{@uri.scheme}:"
    end
    
    def _uri
      @uri
    end
  end
end