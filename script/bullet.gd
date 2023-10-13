class_name  Bullet extends Node2D

@onready var gameScene = find_parent("gameInfo")

var speed = 350
var pierce = 1
var damage = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for effect in gameScene.effects :
		effect.moveBullet(speed* delta,self)
