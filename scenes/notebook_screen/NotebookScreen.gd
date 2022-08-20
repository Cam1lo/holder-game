extends Node2D

signal close_notebook
signal next_page
signal prev_page

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		emit_signal('close_notebook')
	
	if Input.is_action_just_pressed("move_right") and is_notebook_controls_active():
		if $AnimatedSprite.frame == 0:
			$AnimatedSprite.frame = 1
		elif $AnimatedSprite.frame == 1:
			$AnimatedSprite.frame = 2
		emit_signal("next_page")
		
	
	if Input.is_action_just_pressed("move_left") and is_notebook_controls_active():
		if $AnimatedSprite.frame == 1:
			$AnimatedSprite.frame = 0
		elif $AnimatedSprite.frame == 2:
			$AnimatedSprite.frame = 1
		emit_signal("prev_page")

func is_notebook_controls_active():
	return self.visible
	
