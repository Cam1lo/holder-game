extends Area2D

var closed = true

signal locker_open

func _on_Locker_input_event(viewport, event, shape_idx):
	if is_left_click(event):
		toggle_animation()
		closed = not closed
		emit_signal("locker_open")

func is_left_click(event):
	if is_character_inside_area():
		return event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed == true

func toggle_animation():
	$AnimationPlayer.play('open' if closed  else 'close')

func close():
	$AnimationPlayer.play('close')
	
func is_character_inside_area():
	var area2d = get_owner().get_child(0)	
	var areaOverlapingBodies = area2d.get_overlapping_bodies()
	return areaOverlapingBodies.size() > 1 and areaOverlapingBodies[1] is KinematicBody2D
