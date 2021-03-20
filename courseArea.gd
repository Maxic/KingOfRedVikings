extends Area2D


# Declare member variables here. Examples:
var old_damp


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_shallows_body_entered(body):
	if body.name == 'body':
		old_damp = body.linear_damp
		body.linear_damp = 5
		get_node("../../../UI/shallow_label").visible = true

func _on_shallows_body_exited(body):
	if body.name == 'body':
		body.linear_damp = old_damp
		get_node("../../../UI/shallow_label").visible = false


func _on_Area2D_body_entered(body):
	if body.name == 'body':
		old_damp = body.linear_damp
		body.linear_damp = 5

func _on_Area2D_body_exited(body):
	if body.name == 'body':
		body.linear_damp = old_damp

