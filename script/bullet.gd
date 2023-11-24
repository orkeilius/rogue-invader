class_name  Bullet extends Node2D
## script for projectile


@export var sprite = load("res://sprite/bullet/bulletPlayer.tres")

@onready var _AnimatedSprite2D = $AnimatedSprite2D
@onready var gameScene = find_parent("gameInfo")
var speed = 350
var pierce = 1
var effects = []
var origin = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	_AnimatedSprite2D.sprite_frames = sprite
	_AnimatedSprite2D.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for effect in effects :
		effect.moveBullet(speed* delta,self)


func _on_area_2d_area_entered(target : Area2D):
	if target.is_in_group("alien") and origin != "alien":
		pierce -= 1
		if pierce == 0:
			call_deferred("free")
	
	elif target.is_in_group("bullet") and origin != target.origin:
		speed = 0
		_AnimatedSprite2D.sprite_frames = load("res://sprite/bullet/bulletExplosion.tres")
		await get_tree().create_timer(0.25).timeout
		call_deferred("free")
		
	elif target.name == "gameBorder":
		call_deferred("free")

	elif target.is_in_group("player") and origin != "player":
		call_deferred("free")
	
func _on_body_entered(body):
	if body.is_in_group("wall"):
		body.collide(global_position,true)
		call_deferred("free")
 
