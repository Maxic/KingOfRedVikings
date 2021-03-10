extends RichTextLabel


# Declare member variables here. Examples:
var ms = 0
var s = 0
var m = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	ms += 1

