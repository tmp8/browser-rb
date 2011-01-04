module Browser
  module EventTarget
    
    def addEventListener(type, listener, use_capture)
      p ["addEventListener", type]
    end
    
    def dispatchEvent(event)
      p "dispatch"
      true
    end
      
    def removeEventListener(type, listener, use_capture)
      p "remove"
    end
  end
end