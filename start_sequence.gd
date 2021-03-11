extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):


func _on_start_sequence_animation_finished():
	get_node("../../dinghy/body").disable_control = false
	self.visible = false
