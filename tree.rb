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

  def insert(value)
    current_node = @root
    new_node = Node.new(value)
    while current_node 
      if current_node.value < value
        if current_node.right_node == nil
          current_node.right_node = new_node
          break
        end
        current_node = current_node.right_node
      elsif current_node.value > value
        if current_node.value > value
          current_node.left_node = new_node
          break
        end
        current_node = current_node.left_node
      else
        raise "El valor que quieres agregar ya se encuentra en el arbol"
      end
    end
    puts "Nodo #{new_node.value} agregado!"
  end
end