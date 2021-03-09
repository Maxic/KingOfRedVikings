extends RigidBody2D

# Exported variables
export var thrust = 1500
export var torque = 1000
export var fast_threshold = 150

# Particles
var bowsplash_pm = preload("res://BowSplashParticleMat.tres")

# Initializations
var direction: Vector2 = Vector2(0,0)

func _ready():
	pass
	
func _process(delta):
	bowsplash_pm.initial_velocity = sqrt(pow(linear_velocity.x,2)+pow(linear_velocity.y,2)) *.25
	
	
	if Input.is_action_pressed("ui_left") and going_fast(linear_velocity):
		$BoatSprite.play("left")
	elif Input.is_action_pressed("ui_right")and going_fast(linear_velocity):
		$BoatSprite.play("right")
	elif Input.is_action_pressed("boost") and Input.is_action_pressed("ui_up"):
		$BoatSprite.play("boost")	
	else:
		$BoatSprite.play("normal")

func going_fast(velocity):
	
	if abs(velocity.x) > fast_threshold:
		return true
	if abs(velocity.y) > fast_threshold:
		return true
	return false

func _integrate_forces(state):
	direction.y = Input.is_action_pressed("ui_up")
	var thrust_vec = Vector2(0, thrust*-1) * direction.y
	var torque_speed = torque

	if Input.is_action_pressed("boost"):
		thrust_vec = thrust_vec * 3
		torque_speed = torque_speed * 1.2

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
