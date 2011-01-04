module Browser
  module Document
    include Node
    
    def initialize(native_node)
      @native_node = native_node
      native_node.__browser_node = self
    end
    
    def getElementsByTagName(tag_name)
      NodeList.new(@native_node.css(tag_name).map{ |e| HTMLElement.new_from_native(e) })
    end
    
    def createElement(tag_name)
      HTMLElement.new_from_native(@native_node.create_element(tag_name))
    end
    
    def documentElement
      HTMLElement.new_from_native(@native_node.css('html').first)
    end
    
    def createComment(comment)
      Comment.new(self, comment)
    end
    
    def createTextNode(text)
      Comment.new(self, text)
    end
    
    def nodeType
      9
    end
    
    def nodeName
      '#document'
    end
    
    # Not standard, but widely implemented
    def tagName
      ''
    end
  end
end