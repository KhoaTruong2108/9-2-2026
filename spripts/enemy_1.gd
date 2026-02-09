extends CharacterBody2D

@export var Speed:float=300
var movmentVector :Vector2=Vector2(1,0)
@onready var Enemy_Bolt=preload("res://scene/bolt_enemy.tscn")
var timertoshoot:float
@export var timetoloadbullet:float=3
@export var chance:int =3

func _ready():
	timertoshoot=randf_range(-1,timetoloadbullet)
func _physics_process(delta):
	if position.x>=1000:
		movmentVector.x=-1
	elif position.x<=100:
		movmentVector.x=1
	velocity=movmentVector*Speed
	move_and_slide()
	
	if timertoshoot>timetoloadbullet:
		var rng=randi_range(0,chance)
		if rng == 0:
			timertoshoot=0
			var BoltenemyCopy= Enemy_Bolt.instantiate()
			BoltenemyCopy.position= position	
			BoltenemyCopy.position.y += 50
			get_tree().get_root().add_child(BoltenemyCopy)
	else:
		timertoshoot+=delta
