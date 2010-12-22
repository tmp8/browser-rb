require 'rubygems'
require 'nokogiri'
require 'v8'

module Browser
  
  def js_function_with_no_args
    proc do
      yield
    end
  end
  module_function :js_function_with_no_args
end

class Nokogiri::XML::Node
  attr_accessor :__browser_node
end

%w(
  window navigator console named_node_map event_target node element document style node_list html_element
  html_document character_data comment location xml_http_request html_heading_element document_fragment
).each do |file|
  require File.dirname(__FILE__) + "/browser/#{file}"
end