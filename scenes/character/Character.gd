extends KinematicBody2D

export(int) var speed = 80
var controls_active = false
var main
var carrying

func _ready():
	main = get_node("/root/Main")
	var box_arribe = get_node("/root/Main/BoxArrive")
	box_arribe.connect('character_pick_up', self, 'pick_up_box')

func pick_up_box(item):
	print(item.owner , "'s box picked up")
	carrying = item
	
func _physics_process(delta):
	if is_character_able_to_move():
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

func is_character_able_to_move():
	return main.main_screen_controls_active
