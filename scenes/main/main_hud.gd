extends TileMap

signal open_notebook

func _physics_process(delta):
	if Input.is_action_just_pressed("open_notebook"):
		emit_signal('open_notebook')
