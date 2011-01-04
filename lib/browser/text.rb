module Browser
  class Text
    include CharacterData
    
    def initialize(native_node)
      @native_node = native_node
    end
    
    def nodeType
      3
    end
    
    def nodeName
      '#text'
    end
  end
end