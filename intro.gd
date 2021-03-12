extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var start_race = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("boost"):
		self.start_race = true;
		self.visible = false
