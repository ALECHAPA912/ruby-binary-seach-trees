class Node 
  include Comparable
  attr_reader :value, :left_node, :right_node

  def initialize(value)
    @value = value
    @left_node = nil
    @right_node = nil
  end

  def <=>(other)
    @value <=> other.value
  end
end