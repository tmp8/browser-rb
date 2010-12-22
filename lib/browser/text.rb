module Browser
  class Text
    include CharacterData
    
    def initialize(document, comment)
      @native_node = Nokogiri::XML::Text.new(document.native_node, comment)
    end
    
    def nodeType
      3
    end
    
    def nodeName
      '#text'
    end
  end
end