extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var offset_position = Vector2(3.5, 16.5)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#var player_transform = get_node("../../dinghy/body").transform
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_postion = get_node("../../dinghy/body").position
	#print(player_postion.y)
	self.position.x = (player_postion.x * 0.01) + offset_position.x
	self.position.y = (player_postion.y * 0.01) + offset_position.y
	