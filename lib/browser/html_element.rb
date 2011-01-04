module Browser
  class HTMLElement
    include Element
    
    attr_reader :native_node
  
    def initialize(native_node)
      @native_node = native_node
    end
  
    def attributes
      NamedNodeMap.new(@native_node.attributes)
    end
    
    def style
      @style ||= Style.new
    end
    
    def innerHTML=(html)
      native_node.inner_html = html
    end
    
    def tagName
      native_node.name.uppercase
    end
  end
end