extends Node2D

func play(anim):
	%AnimationPlayer.play(anim) 
	
func _physics_process(delta):
	if Input.is_action_pressed("attack"):
		show()
		play("swing")
		
	if !%AnimationPlayer.is_playing():
		hide()
