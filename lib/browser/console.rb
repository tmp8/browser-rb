module Browser
  class Console
    
    def debug(object)
      puts "> #{object.inspect}"
    end
  end
end