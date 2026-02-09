extends Node2D
@export var speed:float = 400 

func _process(delta):
	position.y -= speed*delta
	
	if position.y<0:
		queue_free()
