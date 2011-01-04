module Browser
  class HTMLDocument
    include Document
    
    def getElementById(id)
      element = @native_node.css("##{id}").first
      element && Browser.wrap_node(element)
    end
    
    def body
      Browser.wrap_node(@native_node.css('body').first)
    end
  end
end