extends Spatial

func _input(event):
	if (Input.is_action_pressed("end_game")):
		get_tree().quit() 

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	set_process_input(true)

