module Browser
  class HTMLDocument
    include Document
    
    def initialize(native_node)
      @native_node = native_node
    end
  
    def getElementById(id)
      element = @native_node.css("##{id}").first
      element && HTMLElement.new_from_native(element)
    end
  end
end