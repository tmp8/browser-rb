module Browser
  class HTMLElement
    include Element
    
    attr_reader :native_node
    
    class << self
      def new_from_native(native_node)
        name = native_node.name.capitalize
        name = case name
          when 'A', 'Body', 'Button', 'Code', 'Div', 'Dl', 'Form', 'Head', 'Html', 'Iframe', 'Input',
            'Label', 'Li', 'Link', 'Object', 'Ol', 'Optgroup', 'Option', 'P', 'Param', 'Script',
            'Select', 'Span', 'Strong', 'Table', 'Text', 'Textarea', 'Tr', 'B', 'Th', 'Td', 'Pre', 'Ins',
            'Del', 'Br', 'Em', 'Ul'
            name
          when 'H1', 'H2', 'H3', 'H4', 'H5', 'H6'
            'Heading'
          else
            ''
        end
        
        begin
          eval("HTML#{name}Element").new(native_node)
        rescue NameError => e
          eval(<<-EOS
            class ::Browser::HTML#{name}Element < ::Browser::HTMLElement
            end
          EOS
          )
          retry
        end
      end
    end
  
    def initialize(native_node)
      @native_node = native_node
    end
  
    def attributes
      NamedNodeMap.new(@native_node.attributes)
    end
    
    def style
      @style ||= Style.new
    end
    
    def innerHTML=(html)
      native_node.inner_html = html
    end
    
    def tagName
      native_node.name.uppercase
    end
  end
end