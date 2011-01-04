require 'rubygems'
require 'nokogiri'
require 'v8'
require 'curl'
require 'uri'

module Browser
  
  def js_function_with_no_args
    proc do
      yield
    end
  end
  module_function :js_function_with_no_args
  
  def wrap_node(native_node)
    case native_node
    when Nokogiri::XML::Element
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
    when Nokogiri::XML::DocumentFragment
      DocumentFragment.new(native_node)
    when Nokogiri::XML::Text
      Text.new(native_node)
    when Nokogiri::XML::Comment
      Comment.new(native_node)
    when Nokogiri::HTML::Document
      native_node.__browser_node
    else
      p ['++++++++++++++++++++++++++++++', native_node, caller.first]
      exit
    end
  end
  module_function :wrap_node
end

class Nokogiri::XML::Node
  attr_accessor :__browser_node
end

%w(
  window navigator console named_node_map event_target event_listener node element document style node_list html_element
  html_document character_data comment location xml_http_request html_heading_element document_fragment text
).each do |file|
  require File.dirname(__FILE__) + "/browser/#{file}"
end