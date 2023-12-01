class_name  Bullet extends Node2D
## script for projectile


@export var sprite = load("res://sprite/bullet/bulletPlayer.tres")

@onready var _AnimatedSprite2D = $AnimatedSprite2D
@onready var gameScene = find_parent("gameInfo")
var speed = 350
var pierce = 1
var effects = []
var origin = ""
var doNotFree = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_AnimatedSprite2D.sprite_frames = sprite
	_AnimatedSprite2D.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for effect in effects :
		effect.moveBullet(speed* delta,self)

func delete_Bullet():
	if doNotFree:
		doNotFree = false
		return

	for effect in effects :
		effect.onBulletDied(self)
	call_deferred("free")

func _on_area_2d_area_entered(target : Area2D):
	for effect in effects :
		effect.onBulletCollide(self,target)

	if target.is_in_group("alien") and origin != "alien":
		if target.hp < 0:
			return
		var newPierce = pierce - target.hp
		target.hp -= pierce
		pierce = newPierce
		print("pierce:",pierce)
		target.callUpdateBullet()

	
	elif target.is_in_group("bullet") and origin != target.origin:
		speed = 0
		_AnimatedSprite2D.sprite_frames = load("res://sprite/bullet/bulletExplosion.tres")
		await get_tree().create_timer(0.25).timeout
		delete_Bullet()
		
	elif target.name == "gameBorder":
		delete_Bullet()

	elif target.is_in_group("player") and origin != "player":
		delete_Bullet()
	
	if pierce <= 0:
		delete_Bullet()

func _on_body_entered(body):
	for effect in effects :
		effect.onBulletCollide(self,body)

	if body.is_in_group("wall"):
		body.collide(global_position,true)
		delete_Bullet()
	
	if pierce <= 0:
		delete_Bullet()

 
