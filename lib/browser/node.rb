module Browser
  module Node
    include EventTarget
    
    def native_node
      @native_node
    end
    
    def appendChild(node)
      native_node.add_child(node.native_node)
      node
    end
    
    def insertBefore(new_node, existing_child)
      if existing_child
        existing_child.native_node.before(new_node.native_node)
      else
        native_node.add_child(new_node.native_node)
      end
      new_node
    end
    
    def compareDocumentPosition(node)
      p "Not implemented!"
    end
    
    def firstChild
      native_node.children.first && HTMLElement.new_from_native(native_node.children.first)
    end
    
    def lastChild
      native_node.children.last && HTMLElement.new_from_native(native_node.children.last)
    end
    
    def removeChild(node)
      node.native_node.remove
    end
    
    def parentNode
      native_node.parent && HTMLElement.new_from_native(native_node.parent)
    end
    
    def cloneNode(deep = false)
      HTMLElement.new_from_native(native_node.dup(deep ? 1 : 0))
    end
    
    #TODO should be live!
    def childNodes
      NodeList.new(native_node.children.map { |child| HTMLElement.new_from_native(child) })
    end
    
    # TODO Should return comment node?
    def nextSibling
      native_node.next_sibling && HTMLElement.new_from_native(native_node.next_sibling)
    end
    
    def name
      native_node.name
    end
    
    def id=(id)
      native_node['id'] = id
    end
    
    def id
      native_node['id']
    end
    
    def setAttribute(name, value)
      native_node[name] = value
    end
    
    def createDocumentFragment
      Browser.js_function_with_no_args do
        DocumentFragment.new(self)
      end
    end
  end
end