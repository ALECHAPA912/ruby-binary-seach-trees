require "./tree.rb"

new_tree = Tree.new([1,2,3,4,5,6,7,8,9,10])
new_tree.pretty_print
p new_tree.preorder
p new_tree.inorder
p new_tree.postorder
