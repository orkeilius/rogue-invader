class_name  Bullet extends Node2D

@onready var gameScene = find_parent("gameInfo")

var speed = 350
var pierce = 1
var damage = 1
var effects = []
var origin = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for effect in effects :
		effect.moveBullet(speed* delta,self)


func _on_area_2d_area_entered(target : Area2D):
	if target.is_in_group("alien") and origin != "alien":
		damage -= 1
		if damage == 0:
			queue_free()
