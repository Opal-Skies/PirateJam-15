extends Camera2D

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down") * 50
	global_position += direction
