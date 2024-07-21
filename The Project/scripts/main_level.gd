extends Node2D

var paused = false

func _ready():
	DisplayServer.window_set_mode(3)
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		%Pausemenu.open_menu()
