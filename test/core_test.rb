# encoding: UTF-8

require 'webrick'

server = WEBrick::HTTPServer.new(
  :BindAddress     =>    "localhost",
  :Port            =>    9090,
  :DocumentRoot    =>    File.dirname(__FILE__)
)

%w(INT).each do |signal|
   trap(signal) { server.shutdown && exit }
end

Thread.new do
  server.start
end

require File.dirname(__FILE__) + '/../lib/browser'

browser = Browser::Window.new('http://localhost:9090/core_test.html')

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