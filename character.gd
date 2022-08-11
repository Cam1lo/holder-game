extends KinematicBody2D

export(int) var speed = 80

func _physics_process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$AnimationPlayer.play("walk_left")
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimationPlayer.play("walk_right")
		
	if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		$AnimationPlayer.play("standing")
	
	
	velocity = velocity.normalized()
	
	move_and_slide(velocity * speed)
