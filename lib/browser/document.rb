module Browser
  module Document
    include Node
    
    def initialize(native_node)
      @native_node = native_node
      native_node.__browser_node = self
    end
    
    def getElementsByTagName(tag_name)
      NodeList.new(@native_node.css(tag_name).map{ |e| Browser.wrap_node(e) })
    end
    
    def createElement(tag_name)
      Browser.wrap_node(@native_node.create_element(tag_name))
    end
    
    def documentElement
      Browser.wrap_node(@native_node.css('html').first)
    end
    
    def createComment(comment)
      Browser.wrap_node(Nokogiri::XML::Comment.new(native_node, comment))
    end
    
    def createTextNode(text)
      Browser.wrap_node(Nokogiri::XML::Text.new(text, native_node))
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
    
    # returns nil because documents have no parent
    def parentNode
      nil
    end
    
    # returns nil because documents have no owner
    def ownerDocument
      nil
    end
  end
end