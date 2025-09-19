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
    while current_node
      if current_node.value < value
        last_node = current_node
        current_node = current_node.left_node
      elsif current_node.value > value
        last_node = current_node
        current_node = current_node.right_node
      else
        #si el nodo a borrar no tiene hijos
        if current_node.left_node.nil? && current_node.right_node.nil? && current_node.value < last_node.value
          last_node.left_node == nil
        else
          last_node.right_node == nil
        end
        #si el nodo a borrar tiene dos hijos
        if current_node.left_node && current_node.right_node
          right_next = current_node.right_node
          while right_next
            #FALTA BORRAR EL RIGHT NEXT PARA DESPUES REUBICARLO
            if right_next.left_node.nil?
              #si el nodo a borrar es raiz
              if !last_node
                @root = right_next
                @root.left_node = current_node.left_node
                @root.right_node = current_node.right_node
              #si no es nodo raiz
              else

              end
            end
            right_next = right_next.left_node
          end

        end
        #si el nodo a borrar tiene solo hijo izquierdo
        if current_node.left_node && current_node.left_node.value < last_node.value
          last_node.left_node = current_node.left_node
        else
          last_node.right_node = current_node.left_node
        end
        #si el nodo a borrar tiene solo hijo derecho
        if current_node.right_node && current_node.right_node.value < last_node.value
          last_node.left_node = current_node.right_node
        else
          last_node.right_node = current_node.right_node
        end
      end
    end
  end
end