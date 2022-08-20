extends Node

static func remove_all_childs(node:Node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
