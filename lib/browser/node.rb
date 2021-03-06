module Browser
  module Node
    include EventTarget
    include EventListener
    
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
      native_node.children.first && Browser.wrap_node(native_node.children.first)
    end
    
    def lastChild
      native_node.children.last && Browser.wrap_node(native_node.children.last)
    end
    
    def removeChild(node)
      node.native_node.remove
    end
    
    def parentNode
      native_node.parent && Browser.wrap_node(native_node.parent)
    end
    
    def cloneNode(deep = false)
      Browser.wrap_node(native_node.dup(deep ? 1 : 0))
    end
    
    #TODO should be live!
    def childNodes
      NodeList.new(
        native_node.children.map do |child|
          next if child.is_a? Nokogiri::XML::ProcessingInstruction
          Browser.wrap_node(child)
        end.compact
      )
    end
    
    # TODO Should return comment node?
    def nextSibling
      native_node.next_sibling && Browser.wrap_node(native_node.next_sibling)
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
        DocumentFragment.new(native_node)
      end
    end
    
    def ownerDocument
      Browser.wrap_node(native_node.document)
    end
  end
end