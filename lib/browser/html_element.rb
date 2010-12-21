class Nokogiri::XML::Element
  attr_accessor :__browser_element
end

module Browser
  class HTMLElement
    include Element
    
    attr_reader :native_node
    
    class << self
      def new_from_native(native_node)
        eval("HTML#{native_node.name.capitalize}Element").new(native_node)
      end
    end
  
    def initialize(native_node)
      native_node.__browser_element = self
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