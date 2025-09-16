require "./node.rb"
class Tree 
  def initialize(arr)
    clean_array = prepare_array(arr)
    @root = build_tree(clean_array, 0, clean_array.length - 1)
  end

  def prepare_array(arr)
    arr.uniq.sort
  end

  def build_tree(arr, start, final)
    return nil if start > final
    mid = ((start + final) / 2).floor
    root = Node.new(arr[mid])
    root.set_left(build_tree(arr, start, mid-1))
    root.set_right(build_tree(arr,mid+1,final))
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_node
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_node
  end


  #arr = [1,2]
  #build_tree([1,2], 0, 1)
  #mid = 0; root = 1;
  #root.set_left = build_tree([0..-1], 0, -1)
  #return nil
  #root.set_right = build_tree([1..1], 1, 1)
  #mid = 1; root = 2
  #root.set_left = build_tree()
end