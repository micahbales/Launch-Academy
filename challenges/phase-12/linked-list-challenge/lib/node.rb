class Node
  attr_accessor :info, :next_node

  def initialize(info, next_node = nil)
    self.info = info
    self.next_node = next_node
  end
end
