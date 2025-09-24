require "./tree.rb"

new_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
new_tree.pretty_print
new_tree.level_order_recursive do |node|
  puts node
end