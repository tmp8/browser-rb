module Browser
  class XMLHttpRequest
    attr_accessor :onreadystatechange
    
    def initialize(window)
      @window = window
    end
    
    def open(method, url, async = false, username = nil, password = nil)
      @ready_state = 0
      
      @curl = Curl::Easy.new(@window.location._uri.merge(url).to_s)
      @curl.verbose = true
      
      @curl.username = username
      @curl.password = password
      
      @ready_state = 1
    end
    
    def send(data)
      begin
        @curl.perform
      rescue Exception => e
        p e
        @ready_state = 4
        @onreadystatechange.call('error')
      else
        @ready_state = 4
        @onreadystatechange.call('success')
      end
    end
    
    def status
      @curl && @curl.response_code
    end
    
    def responseText
      @curl.body_str
    end
    
    def readyState
      @ready_state
    end
    
    def getResponseHeader(header)
      (@curl.header_str =~ /#{header}: (.*?);/) && $1
    end
  end
end