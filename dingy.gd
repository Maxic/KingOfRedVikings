extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 50
export var max_angle = 0.2617994
export var turn_speed = 0.01


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction: Vector2 = Vector2(0,0)
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	print("current rot: " + str(transform.get_rotation()))
	print("calculated: " + str(calc_rotation(direction.x)))
	rotate(calc_rotation(direction.x))
	
	# Apply movement
	var movement = speed * direction * delta
	move_and_collide(movement)

func calc_rotation(vert_direction):
	# Rotate towards, but never over this max_angle (0.2617994 - 15 degrees)
	if vert_direction > 0:
		if transform.get_rotation() >= max_angle*vert_direction:
			return 0
	elif vert_direction < 0:
		if transform.get_rotation() <= max_angle*vert_direction:
			return 0
	return turn_speed * vert_direction
	
