module Browser
  class Window
    
    class << self
      def open(url)
        uri = URI.parse(url)
        unless uri.scheme
          uri = URI.parse("file://#{File.expand_path(url)}")
        end
        
        @@url = uri
        new(IO.read(url))
      end
      
      def url
        @@url
      end
    end
    
    def initialize(html)
      @native_native_node = Nokogiri::HTML(html)
      @document = HTMLDocument.new(@native_native_node)
      @properties = {}
    end
  
    def alert(object)
      puts "js: #{object.inspect}"
    end
    
    def console
      @console ||= Console.new
    end
    
    def document
      @document
    end
    
    def navigator
      @navigator ||= Navigator.new
    end
    
    def location
      @location ||= Location.new
    end
    
    def XMLHttpRequest
      XMLHttpRequest
    end
    
    def decodeURIComponent(component)
      p "Not implmented!"
    end
  end
end