module Browser
  class DocumentFragment
    include Node

    def initialize(native_node)
      @native_node = Nokogiri::XML::DocumentFragment.new(native_node)
    end
  end
end