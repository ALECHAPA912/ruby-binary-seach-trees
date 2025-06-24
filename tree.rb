require './node.rb'
class Tree

  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree(@array, 0, @array.length-1)
  end

  def build_tree(array, start, final)
    return nil if(start > final)
    mid = (start + final) / 2
    root = Node.new(array[mid])

    root.set_left(build_tree(array, start, mid-1))
    root.set_right(build_tree(array,mid+1, final))

    root
  end

  def insert(root, data)
    return new.Node(data) if root == nil
    return root if root.data == data

    if data < root.data
      root.set_left(insert(root.left_node, data))
    elsif key > root.data
      root.set_right(insert(root.right_node, data))
    end

    return root
  end

  def get_succesor(current_node)
    curr = current_node.right_node
    while curr != nil && curr.left_node != nil
      curr = curr.left_node
    end
    return curr
  end

  def delete(root, x)
    return root if root == nil
    
    if root.data > x
      root.set_left(delete(root.left_node, x)) 
    elsif root.data < x
      root.set_right(delete(root.right_node, x))
    else
      if root.left_node == nil
        return root.right_node
      end
      if root.right_node == nil
        return root.left_node
      end

      succ = get_succesor(root)
      root.set_data(succ.data)
      root.set_right = delete(root.right_node, succ.data)
    end

    root
  end

  def height(value)
    node = find(@root, value)
    return nil unless node

    node_height(node)
  end

  def find(current, value)
    return nil if current.nil?
    return current if current.data == value

    left_result = find(current.left_node, value)
    return left_result if left_result

    find(current.right_node, value)
  end

  def node_height(node)
    return 0 if node.left_node.nil? && node.right_node.nil?

    left_height = node.left_node ? node_height(node.left_node) : -1
    right_height = node.right_node ? node_height(node.right_node) : -1

    1 + [left_height, right_height].max
  end

  def depth(value)
    depth_recursive(@root, value, 0)
  end

  def node_depth(node, value, current_depth)
    return nil if node.nil?
    if node.data == value
      return current_depth
    elsif value < node.data
      return node_depth(node.left_node, value, current_depth + 1)
    else
      return node_depth(node.right_node, value, current_depth + 1)
    end
  end


  def level_order
    return if @root == nil

    q, q2 = []
    q.push(@root)

    while !q.empty?
      curr = q.first
      yield(curr)
      q.push(curr.left_node) if curr.left_node != nil
      q.push(curr.right_node) if curr.right_node != nil
      q2.push(q.shift)
    end
    
    if !block_given?
      return q2
    end
  end
  
  def preorder(root = @root, result = [], &block)
    return result if root == nil
    if block_given?
      yield(root)
    else
      result << root
    end
    preorder(root.left_node, result, &block)
    preorder(root.right_node, result, &block)
    result
  end

  def inorder(root = @root, result = [], &block)
    return result if root == nil
    inorder(root.left_node, result, &block)
    if block_given?
      yield(root)
    else
      result << root
    end
    inorder(root.right_node, result, &block)
    result
  end

  def postorder(root = @root, result = [], &block)
    return result if root == nil
    postorder(root.left_node, result, &block)
    postorder(root.right_node, result, &block)
    if block_given?
      yield(root)
    else
      result << root
    end
    result
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_node
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_node
  end
  
end