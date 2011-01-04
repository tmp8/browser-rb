module Browser
  module Element
    include Node
    
    def getElementsByTagName(tag_name)
      NodeList.new(native_node.css(tag_name).map{ |e| HTMLElement.new_from_native(e) })
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
    
    def createElement(tag_name)
      native_node.document.__browser_node.createElement(tag_name)
    end
    
    def getAttribute(name)
      native_node.attribute(name).content
    end
  end
end