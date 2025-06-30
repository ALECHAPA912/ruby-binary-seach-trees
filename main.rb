require './tree.rb'

tree = Tree.new(Array.new(15) { rand(1..100) })

tree.pretty_print
puts tree.balanced?
puts tree.preorder
puts tree.inorder
puts tree.postorder
tree.insert(123)
tree.insert(231)
tree.insert(912)
puts tree.balanced?
tree.rebalance
puts tree.balanced?