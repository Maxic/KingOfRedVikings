extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var offset_position = Vector2(192, 28)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#var player_transform = get_node("../../dinghy/body").transform
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_node("../../dinghy/body")
	var player_position = player.position
	var player_rotation = player.rotation
	#print(player_postion.y)
	self.rotation = player_rotation
	self.position.x = (player_position.x * 0.012) + offset_position.x
	self.position.y = (player_position.y * 0.012) + offset_position.y
	
