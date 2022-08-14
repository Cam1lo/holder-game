extends Area2D

var closed = true

signal locker_open

func _ready():
	print(get_owner())

func _on_Locker_input_event(viewport, event, shape_idx):
	if is_left_click(event):
		toggle_animation()
		closed = not closed
		emit_signal("locker_open")

func is_left_click(event):
	return event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed == true

func toggle_animation():
	$AnimationPlayer.play('open' if closed  else 'close')

func close():
	$AnimationPlayer.play('close')
	
func is_inside_area():
	return true
