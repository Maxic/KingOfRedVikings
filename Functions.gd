extends Node2D

var rnd = RandomNumberGenerator.new()

func get_first_child_of_type(var rootNode : Node2D, var classType):
	return _get_first_child_of_type(rootNode.get_parent(), classType)


func _get_first_child_of_type(var rootNode : Node2D, var classType):
		
	if rootNode == null:
		return null
		
	var children = rootNode.get_children()
		
	for index in rootNode.get_child_count():
		if children[index] is classType:
			return children[index]
		else:
			var sub_res = _get_first_child_of_type(children[index], classType)
			if sub_res != null:
				return sub_res
	
	return null

func random(var minVal : float, var maxVal : float) -> float:
	return rnd.randf_range(minVal, maxVal)

func gameTime():
	return OS.get_ticks_msec()

func elapsed(var gameTime : float, var interval : float):
	return OS.get_ticks_msec() - gameTime >= interval
