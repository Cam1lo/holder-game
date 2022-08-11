extends Node2D

var closet = []

func _ready():
	for i in range(24):
		closet.append(false)
		$AnimationPlayer.play('close' + str(i + 1))


func _on_Area2D_input_event(viewport, event, shape_idx, locker_id):
	if is_left_click(event):
		var open_locker = get_open_locker_id()
		if open_locker != null:
			close_locker(get_open_locker_id())
		yield(get_tree().create_timer(0.01), "timeout")
		toggle_animation_given_locker_id(locker_id)
		closet[locker_id-1] = not closet[locker_id-1]
	

func is_left_click(event):
	return event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed == true

func get_open_locker_id():
	for i in closet.size():
		if closet[i] == true:
			return i + 1 
	return null

func close_locker(locker_id):
	$AnimationPlayer.play("close" + str(locker_id))
	closet[locker_id-1] = not closet[locker_id-1]

func toggle_animation_given_locker_id(locker_id):
	$AnimationPlayer.play('open' + str(locker_id) if not closet[locker_id-1] else 'close' + str(locker_id))

