extends CanvasLayer


var wakeLeft = preload("res://WakeLeftParticle.tres")
var wakeRight = preload("res://WakeRightParticle.tres")

var particles = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for particle in particles:
		var particles_instance = Particles2D.new()
		particles_instance.set_process_material(particle)
		particles_instance.set_one_shot(true)
		particles_instance.set_modulate(Color(1,1,1,0))
		particles_instance.set_emitting(true)
		self.add_child(particles_instance)
