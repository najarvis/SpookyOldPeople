extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _input(event):
	if (event.type == InputEvent.MOUSE_MOTION):
		print("Mouse Motion at: ", event.relative_pos)
		#var cam_xform = get_node("Camera").get_global_transform()
		
		rotate_y( event.relative_x / 100.0)
		rotate_x( event.relative_y / 100.0)

		#cam_xform.basis = cam_xform.basis + Input.get_mouse_speed().normalized()

func _ready():
	set_process_input(true)