module Browser
  class DocumentFragment
    include Node

    def initialize(document)
      @native_node = Nokogiri::XML::DocumentFragment.new(document.native_node)
    end
  end
end