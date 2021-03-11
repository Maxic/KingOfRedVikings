extends RichTextLabel


# Declare member variables here. Examples:
var ms = 0
var s = 0
var m = 0
var finished = false
var blinking = false
var time = 0.0
var run = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if finished:
		self.get_node("./ms").stop()
		self.rect_scale = Vector2(1.2,1.2)
		self.rect_position = Vector2(80, 60)
		finished = false
		blinking = true
	if blinking:
		time += delta * 6.0
		self.modulate.a = sin(time)
	
	if ms > 9:
		s += 1
		ms = 0
	
	if s > 59:
		m += 1
		s = 0
	
	if s < 10:
		set_text(str(m) + ":0" + str(s) + ":0" + str(ms))
	else:
		set_text(str(m) + ":" + str(s) + ":0" + str(ms))


func _on_ms_timeout():
	if run:
		ms += 1



func _on_start_sequence_animation_finished():
	run = true
