module Browser
  class HTMLDocument
    include Document
    
    def getElementById(id)
      element = @native_node.css("##{id}").first
      element && HTMLElement.new_from_native(element)
    end
    
    def body
      HTMLElement.new_from_native(@native_node.css('body').first)
    end
  end
end