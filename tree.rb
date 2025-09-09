class Tree 
  
  def initialize(arr)
    @root = build_tree(arr.sort)
  end

  def build_tree(arr)
    start = 0
    final = arr.length - 1
    return if start > final
    mid = ((start + final)/2).floor
    left_tree = build_tree(arr[start..mid])
    right_tree = build_tree(arr[mid+1..final])
    root = Node.new(arr[mid], left_tree, right_tree)
    root
  end

  #arr = [1,2,3,4]
  #build_tree([1,2,3,4])
  #build_tree([1,2])
  #build_tree([1])
end