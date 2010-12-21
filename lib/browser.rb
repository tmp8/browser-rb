require 'rubygems'
require 'nokogiri'
require 'v8'

%w(
  window navigator console named_node_map event_target node element document style node_list html_element
  html_document html_div_element html_script_element html_select_element html_option_element
  html_html_element html_body_element character_data comment html_link_element html_table_element
  html_a_element html_input_element location xml_http_request html_ol_element html_h1_element
  html_h2_element html_p_element html_head_element html_strong_element html_li_element
  html_object_element html_form_element html_code_element html_text_element html_dl_element
  html_label_element html_span_element
  
).each do |file|
  require File.dirname(__FILE__) + "/browser/#{file}"
end