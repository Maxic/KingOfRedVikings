extends RigidBody2D

export var thrust = 3000
var direction: Vector2 = Vector2(0,0)
var torque = 8000

func _ready():
	pass

func _integrate_forces(state):
	direction.y = Input.is_action_pressed("ui_up")
	var thrust_vec = Vector2(0, thrust*-1) * direction.y

	applied_force = thrust_vec.rotated(rotation)

	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	
	if direction.y != 0:
		applied_torque = rotation_dir * torque
	else:
		applied_torque = 0
