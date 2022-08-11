extends Node2D

var closed = true;

func _on_Area2D_input_event(viewport, event, shape_idx, id):
	if is_left_click(event):
		print('clicked ', id)
		$AnimationPlayer.play('open' if closed else 'close')
		closed = not closed
	

func is_left_click(event):
	return event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed == true
