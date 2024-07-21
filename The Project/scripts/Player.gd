extends CharacterBody2D
const MAX_SPEED = 100
const G = 9.81
const DOUBLE_JUMPS = 1
var v_move = 0
var jump_ready = false
var jumps = 0

func _physics_process(delta):
	
	var speed = MAX_SPEED
	
	var h_move =  (Input.get_action_strength("right") - Input.get_action_strength("left"))
	if h_move < 0:
		$AnimatedSprite2D.flip_h = true
	elif h_move > 0:
		$AnimatedSprite2D.flip_h = false
	if h_move != 0:
		%AnimationPlayer.play("walk")
	else:
		%AnimationPlayer.play("RESET")
	
	if Input.get_action_strength("jump") == 1 && jumps > 0 && jump_ready == true:
		v_move = -300
		jumps -= 1
		jump_ready = false
	if Input.get_action_strength("jump") == 0:
		jump_ready = true
	v_move += G
	
	var movement = Vector2(h_move * speed,v_move)
	velocity = movement
	move_and_slide()

func _on_ground_check_grounded():
	jumps = DOUBLE_JUMPS + 1
	jump_ready = true
	v_move = 0

