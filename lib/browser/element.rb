module Browser
  module Element
    include Node
    
    def getElementsByTagName(tagName)
      NodeList.new(native_node.css(tagName).map{ |e| HTMLElement.new_from_native(e) })
    end
    
    def nodeType
      1
    end
    
    def nodeName
      native_node.name
    end
    
    def tagName
      native_node.name
    end
  end
end