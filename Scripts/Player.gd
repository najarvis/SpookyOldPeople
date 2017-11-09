extends KinematicBody

const GRAVITY = -9.81
const WALK_SPEED = 3

var vel = Vector3()

func _fixed_process(delta):

	var dir = Vector3()
	var cam_xform = get_node("Camera").get_global_transform()

	vel.y += delta * GRAVITY

	if (Input.is_action_pressed("move_forward")):
		dir += -cam_xform.basis[2]

	elif (Input.is_action_pressed("move_backwards")):
		dir += cam_xform.basis[2]

	if (Input.is_action_pressed("strafe_left")):
		dir += -cam_xform.basis[0]

	elif (Input.is_action_pressed("strafe_right")):
		dir += cam_xform.basis[0]

	#dir.y = 0
	dir = dir.normalized()
	dir.y = vel.y

	var motion = dir * WALK_SPEED * delta

	#var motion = vel * delta
	move( motion )

	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		vel = n.slide(vel)
		move(motion)

func _ready():
	set_fixed_process(true)
