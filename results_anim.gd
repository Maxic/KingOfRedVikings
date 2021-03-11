extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node('../results').finished:
		if Input.is_action_just_pressed("boost"):
			self.visible = true
			get_node('../results').visible = false
			self.play()
