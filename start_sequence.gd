extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var start_race = get_node("../../intro").start_race
	if start_race:
		if !started:
			self.visible = true
			self.play()
			get_node("../countdown").play()
			started = true
		

func _on_start_sequence_animation_finished():
	get_node("../../../dinghy/body").disable_control = false
	self.visible = false
