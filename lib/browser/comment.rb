module Browser
  class Comment
    include CharacterData
    
    def initialize(document, comment)
      @native_node = Nokogiri::XML::Comment.new(document.native_node, comment)
    end
    
    def nodeType
      8
    end
    
    def nodeName
      '#comment'
    end
  end
end