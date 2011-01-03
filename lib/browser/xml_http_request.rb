require 'uri'

module Browser
  class XMLHttpRequest
    attr_accessor :onreadystatechange
    
    def open(method, url, async = false, username = nil, password = nil)
      @ready_state = 0
      
      @curl = Curl::Easy.new(Window.url.merge(url).to_s)
      @curl.verbose = true
      
      @curl.username = username
      @curl.password = password
      
      @ready_state = 1
    end
    
    def send(data)
      begin
        @curl.perform
      rescue Exception => e
        @ready_state = 4
        @onreadystatechange.call('error')
        p e
      else
        @ready_state = 4
        @onreadystatechange.call('success')
      end
    end
    
    def status
      @curl.response_code
    end
    
    def responseText
      @curl.body_str
    end
    
    def readyState
      @ready_state
    end
  end
end