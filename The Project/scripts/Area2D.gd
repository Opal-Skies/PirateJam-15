extends Area2D

signal grounded

func _physics_process(delta):
	for i in get_overlapping_bodies():
		if i.is_in_group("ground"):
			grounded.emit()
