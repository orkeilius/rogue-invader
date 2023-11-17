class_name AbstractEffectEntity extends Area2D

@export var shootTimeout : float = 1.25
@export var speed : float = 30
@export var effects = []

var bulletObject = load("res://object/bullet.tscn")


func addEffects(list:Array):
	if effects == null:
		effects = []
	
	for elem in list:
		effects.append(elem.new(self))

func call_shoot(origin:String):

	var bullet = bulletObject.instantiate()
	bullet.origin = origin
	for effect in effects :
		effect.applyBallEffect(bullet)

	for effect in effects :
		effect.onShoot(bullet,self)
