extends RigidBody2D

export var thrust = 1500
var direction: Vector2 = Vector2(0,0)
var torque = 1000


func _ready():
	pass
	
func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		$BoatSprite.play("left")
	if Input.is_action_pressed("ui_right"):
		$BoatSprite.play("right")
	if Input.is_action_pressed("boost"):
		$BoatSprite.play("boost")	
	if Input.is_action_just_released("boost") or Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right") :
		$BoatSprite.play("normal")

func _integrate_forces(state):
	direction.y = Input.is_action_pressed("ui_up")
	var thrust_vec = Vector2(0, thrust*-1) * direction.y
	var torque_speed = torque

	if Input.is_action_pressed("boost"):
		thrust_vec = thrust_vec * 3
		torque_speed = torque_speed * 2

	applied_force = thrust_vec.rotated(rotation)

	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	
	if direction.y != 0:
		applied_torque = rotation_dir * torque_speed
	else:
		applied_torque = 0
