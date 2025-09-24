require "./tree.rb"

new_tree = Tree.new([1,2,3,4,5,6,7,8,9,10])
new_tree.pretty_print
new_tree.insert(11)
new_tree.insert(12)
new_tree.insert(13)
new_tree.insert(14)
new_tree.pretty_print
puts new_tree.height(6)
