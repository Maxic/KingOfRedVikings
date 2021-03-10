extends Node2D
class_name ShockWaveComponent

onready var _functions : Functions = get_node("/root/Functions")

var _shockWave_Material : Material
var _isProcessing : bool = false
var _duration : float
var _processStart : float

var _minSize : float
var _maxSize : float
var _minForce : float
var _maxForce : float

func _ready():
	_shockWave_Material = self.get_material().duplicate(true)
	self.set_material(_shockWave_Material)
	
func explode(var position : Vector2, var minForce : float = 0, var maxForce : float = 0.015, var minSize : float = 0.15, var maxSize : float = 0.25, var thickness : float = 0.02, var durationMS : float = 500):
	_shockWave_Material.set_shader_param("thickness", thickness)
	var normalizedPosition = position / _functions.get_virtual_resolution()
	normalizedPosition.y = 1 - normalizedPosition.y
	_shockWave_Material.set_shader_param("center", normalizedPosition)
	_processStart = _functions.gameTime()
	_duration = durationMS
	_minSize = minSize
	_maxSize = maxSize
	_minForce = minForce
	_maxForce = maxForce
	_isProcessing = true
	
# warning-ignore:unused_argument
func _process(delta):
	
	if !_isProcessing:
		return
	
	# calculate how long we already execute
	var elapsedMS = max(_functions.gameTime() - _processStart, 0.001)
	var progress = elapsedMS / _duration
	# calculate our current size
	var size = _minSize + ((_maxSize - _minSize) * progress)
	var force = _minForce + ((_maxForce - _minForce) * (1.0 - progress))
	_shockWave_Material.set_shader_param("size", size)
	_shockWave_Material.set_shader_param("force", force)
	
	if progress >= 1.0:
		queue_free()
