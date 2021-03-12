extends RigidBody2D

# Exported variables
export var thrust = 1000
export var torque = 2000
export var fast_threshold = 120

# Particles
var bowsplash_pm = preload("res://BowSplashParticleMat.tres")
var wake = preload("res://Wake.tscn")


# Initializations
var direction: Vector2 = Vector2(0,0)
var wake_instance
var normalized_velocity
var disable_control = true
var boatsprite

func _ready():
	randomize()
	var options = [$BoatWhite,$BoatYellow,$BoatGreen]
	var rand_index:int = randi() % options.size()
	boatsprite = options[rand_index]
	boatsprite.visible = true 
	
	
func _process(delta):
	var true_velocity = sqrt(pow(linear_velocity.x,2)+pow(linear_velocity.y,2)) *.15
	bowsplash_pm.initial_velocity = true_velocity

	normalized_velocity = true_velocity/60

	get_node("../../UI/SpeedDisplay").value = normalized_velocity * 100
	get_node("EngineSound").pitch_scale = (5 * normalized_velocity) +3

	# Wake particles
	if abs(true_velocity) > 4:
		wake_instance = wake.instance()
		wake_instance.transform = self.transform
		for child in wake_instance.get_children():
			child.emitting = true
			child.amount = (child.amount * pow(true_velocity,2) * .01) + 1
		get_node("../").add_child(wake_instance)
		
	
	if Input.is_action_pressed("ui_left") and going_fast(linear_velocity):
		boatsprite.play("left")
	elif Input.is_action_pressed("ui_right")and going_fast(linear_velocity):
		boatsprite.play("right")
	elif Input.is_action_pressed("boost") and Input.is_action_pressed("ui_up"):
		boatsprite.play("boost")	
	else:
		boatsprite.play("normal")

	if disable_control:
		boatsprite.play("normal")

func going_fast(velocity):
	
	if abs(velocity.x) > fast_threshold:
		return true
	if abs(velocity.y) > fast_threshold:
		return true
	return false

func _integrate_forces(state):
	var torque_speed = torque
	var thrust_vec = Vector2(0, thrust*-1)
	
	# Set some params based on forward or backwards movement
	if Input.is_action_pressed("ui_up"):
		direction.y = 1
	elif Input.is_action_pressed("ui_down"):
		direction.y = -.1
		torque_speed = torque_speed *.3
	else:
		direction.y = 0
		
	if disable_control:
		direction.y = 0
		
	thrust_vec = thrust_vec * direction.y
	
	# boost stuff
	if Input.is_action_pressed("boost"):
		thrust_vec = thrust_vec * 2
		torque_speed = torque_speed * 1.2

	# Actually apply the force
	applied_force = thrust_vec.rotated(rotation)

	# Rotation stuff
	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	
	if direction.y != 0:
		applied_torque = rotation_dir * torque_speed
	else:
		applied_torque = 0
