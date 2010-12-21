module Browser
  class NodeList

    def initialize(array)
      @array = array
    end
    
    def item(index)
      @array[index]
    end
    
    def length
      @array.size
    end
  end
end