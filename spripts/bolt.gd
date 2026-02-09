extends Node2D
@export var speed:float = 400 
@onready var exploation = preload("res://scene/explor.tscn")
func _ready():
	await get_tree().create_timer(2.0).timeout
	queue_free()
func _process(delta):
	position.y -= speed*delta
	
	if position.y<0:
		queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy") or body.is_in_group("player"):
		var exploationCopy= exploation.instantiate()
		exploationCopy.position= position	
		get_tree().get_root().add_child(exploationCopy)
		body.queue_free()
		
		
