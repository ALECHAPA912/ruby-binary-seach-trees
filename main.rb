require "./tree.rb"

new_tree = Tree.new(Array.new(15) { rand(1..100) })
new_tree.pretty_print
puts new_tree.balanced?
new_tree.insert(1)
new_tree.insert(2)
new_tree.insert(3)
new_tree.insert(4)
new_tree.insert(5)
new_tree.insert(6)
new_tree.insert(7)
new_tree.insert(8)
new_tree.insert(9)
new_tree.insert(10)
new_tree.pretty_print
puts new_tree.balanced?
new_tree.rebalance
new_tree.pretty_print
puts new_tree.balanced?

