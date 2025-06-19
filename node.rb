class Node

  attr_reader :data, :left_node, :right_node
  
  def initialize(data = nil, left_node = nil, right_node = nil)
    @data = data
    @left_node = left_node
    @right_node = right_node
  end

  def set_left(left_node)
    @left_node = left_node
  end

  def set_right(right_node)
    @right_node = right_node 
  end

  def set_data(data)
    @data = data
  end
  
  def to_s
    "Value: #{@data}, Left Node: #{@left_node}, Right Node: #{@right_node}"
  end
end