extends CharacterBody2D

var movementVector
@export var Speed:float
@onready var Bolt=preload("res://scene/bolt.tscn")
func _physics_process(delta):
	movementVector=Vector2(Input.get_axis("left", "right"),Input.get_axis("forward","back"))
	print(movementVector)
	velocity = movementVector.normalized()*200
	move_and_slide()
	
	if Input.is_action_just_pressed("space"):
		var BoltCopy= Bolt.instantiate()
		BoltCopy.position=position
		BoltCopy.position.y -= 50
		get_tree().get_root().add_child(BoltCopy)
