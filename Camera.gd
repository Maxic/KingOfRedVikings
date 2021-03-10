extends Camera2D


# Declare member variables here. Examples:
var player
export var x_margin = 50
export var y_margin = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var linear_velocity = player.linear_velocity
	var true_velocity = sqrt(pow(linear_velocity.x,2)+pow(linear_velocity.y,2)) *.15
	var old_offset = self.offset
	var old_zoom = self.zoom
	var max_zoom = 1.6

	# Zoom out when going fast
	self.zoom = lerp(self.zoom, (self.zoom*(true_velocity/50)+Vector2(.6,.6)), delta*10)
	print(true_velocity)
	if self.zoom > old_zoom and self.zoom.y > max_zoom:
		self.zoom = old_zoom
	if self.zoom.y < 1:
		self.zoom = old_zoom	

	# Change offset according to speed
	self.offset = lerp(self.offset, linear_velocity, delta*2)
	if abs(self.offset.y) > x_margin:
		self.offset.y = old_offset.y	
	if abs(self.offset.x) > y_margin:
		self.offset.x = old_offset.x
	
	
