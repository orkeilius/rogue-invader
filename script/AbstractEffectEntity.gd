class_name AbstractEffectEntity extends Area2D

@export var shootTimeout : float = 1.25
@export var speed : float = 30
@export var effects = []
@export var origin = ""

var bulletObject = load("res://object/bullet.tscn")


func addEffects(list:Array):
	if effects == null:
		effects = []
	for elem in list:
		effects.append(elem.new(self))

func generateBullet()-> Bullet: 
	var bullet = bulletObject.instantiate()
	bullet.origin = origin
	for effect in effects :
		effect.applyBallEffect(bullet)

	return bullet


func call_shoot():
	for effect in effects :
		effect.onShoot(self)
