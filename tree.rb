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

  def delete(value)
    current_node = @root
    last_node = nil
    while current_node && current_node.value != value
      if current_node.value < value
        last_node = current_node
        current_node = current_node.left_node
      elsif current_node.value > value
        last_node = current_node
        current_node = current_node.right_node
      end
    end
    return puts "El valor que desea borrar no se encuentra en el arbol" if current_node.nil?

    if current_node.left_node && current_node.right_node #si el nodo a borrar tiene dos hijos
      right_next = current_node.right_node #right_next es el nodo mayor siguiente al nodo actual
      while right_next
        if right_next.left_node.nil? 
          right_next.left_node = current_node.left_node
          right_next.right_node = current_node.right_node
          if !last_node #si el nodo a borrar es raiz
            @root = right_next
          else #si no es nodo raiz
            if current_node.value < last_node.value
              last_node.left_node = right_next
            else
              last_node.right_node = right_next
            end
          end
        end
        right_next = right_next.left_node
      end
    end

    if current_node.right_node.nil? && current_node.left_node && current_node.left_node.value < last_node.value #si el nodo a borrar tiene solo hijo izquierdo
      last_node.left_node = current_node.left_node
    else
      last_node.right_node = current_node.left_node
    end

    if current_node.left_node.nil? && current_node.right_node && current_node.right_node.value < last_node.value #si el nodo a borrar tiene solo hijo derecho
      last_node.left_node = current_node.right_node
    else
      last_node.right_node = current_node.right_node
    end 

    if current_node.left_node.nil? && current_node.right_node.nil? && current_node.value < last_node.value #si el nodo a borrar no tiene hijos
      last_node.left_node == nil
    else
      last_node.right_node == nil
    end

    puts "Nodo #{current_node.value} eliminado!"
    current_node
  end

  def find(value)
    current_node = @root
    while current_node 
      return current_node if current_node.value == value
      if current_node.value < value
        current_node = current_node.right_node
      else
        current_node = current_node.left_node
      end
    end
    nil
  end

  def level_order
  end
  
  def level_order_recursive(root = @root, q)
    return nil if root.nil?
    
  end
end