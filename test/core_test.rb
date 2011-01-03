# encoding: UTF-8

require File.dirname(__FILE__) + '/../lib/browser'

browser = Browser::Window.open('core_test.html')

V8::Context.new(:with => browser) do |js|
  
  js.eval("var window = this;")
  
  browser.document.native_node.css('script').each do |script_node|
    if script_node.keys.include?('src')
      p script_node['src']
      js.load(script_node['src'])
    else
      js.eval(script_node.text)
    end
  end
end