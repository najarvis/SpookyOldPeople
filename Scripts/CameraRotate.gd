extends Camera

func _input(event):
	if (event.type == InputEvent.MOUSE_MOTION):
		global_rotate( Vector3(0, 1, 0), event.relative_x / 100.0)
		rotate_x(event.relative_y / 100.0)

func _ready():
	set_process_input(true)
