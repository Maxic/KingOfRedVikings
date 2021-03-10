extends TileMap


# Declare member variables here. Examples:
var checkpoints_passed
var finished 
var timer_parent = preload("res://UI.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoints_passed = 0
	finished = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_checkpoint1_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 0:
			checkpoints_passed = 1
			get_node("../../UI/checkpoint_label").triggered = true
			

func _on_checkpoint2_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 1:
			checkpoints_passed = 2
			get_node("../../UI/checkpoint_label").triggered = true

func _on_checkpoint3_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 2:
			checkpoints_passed = 3
			get_node("../../UI/checkpoint_label").triggered = true

func _on_checkpoint4_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 3:
			checkpoints_passed = 4
			get_node("../../UI/checkpoint_label").triggered = true

func _on_checkpoint5_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 4:
			checkpoints_passed = 5
			get_node("../../UI/checkpoint_label").triggered = true

func _on_checkpoint6_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 5:
			checkpoints_passed = 6
			get_node("../../UI/checkpoint_label").triggered = true

func _on_checkpoint7_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 6:
			checkpoints_passed = 7
			get_node("../../UI/checkpoint_label").triggered = true

func _on_checkpoint8_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 7:
			checkpoints_passed = 8
			get_node("../../UI/checkpoint_label").triggered = true

func _on_checkpoint9_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 8:
			checkpoints_passed = 9
			get_node("../../UI/checkpoint_label").triggered = true

func _on_finish_body_entered(body):
	if body.name == "body":
		if checkpoints_passed == 9:
			finished = true
			get_node("../../UI/TimerDisplay/ms").stop()
			get_node("../../UI/TimerDisplay").finished = true
