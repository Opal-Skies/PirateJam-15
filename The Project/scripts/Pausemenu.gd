extends CanvasLayer

func _ready():
	hide()

func open_menu():
	get_tree().paused = true
	show()
	
func close_menu():
	hide()
	get_tree().paused = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		close_menu()
