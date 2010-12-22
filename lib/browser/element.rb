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
    
    def createDocumentFragment
      Browser.js_function_with_no_args do
        native_node.document.__browser_node.createDocumentFragment
      end
    end
    
    def createElement(tag_name)
      native_node.document.__browser_node.createElement(tag_name)
    end
  end
end