module Browser
  module Document
    include Node
    
    def getElementsByTagName(tag_name)
      NodeList.new(@native_node.css(tagName).map{ |e| HTMLElement.new_from_native(e) })
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
    
    def nodeType
      9
    end
    
    def nodeName
      '#comment'
    end
    
    # Not standard, but widely implemented
    def tagName
      ''
    end
  end
end