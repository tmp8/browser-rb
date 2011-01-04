module Browser
  class Comment
    include CharacterData
    
    def initialize(native_node)
      @native_node = native_node
    end
    
    def nodeType
      8
    end
    
    def nodeName
      '#comment'
    end
  end
end