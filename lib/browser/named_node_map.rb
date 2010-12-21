module Browser
  class NamedNodeMap
    attr_reader :attributes
  
    def initialize(attributes)
      @attributes = attributes
    end
  
    def length
      @attributes.size
    end
  
    def getNamedItem(key)
      @attributes[key]
    end
  
    def item(index)
      @attributes.to_a[index].last
    end
  
    def removeNamedItem(name)
      @attributes.delete(name)
    end
  
    def setNamedItem(name)
      # stub
    end
  end
end