class_name AbstractEffectEntity extends Area2D
## class to handle effect related logic of entity
## (player and alien)


@export var effects = []
@export var origin = ""


## entity setting that can be change by effect
@export var shootTimeout : float = 1.25
@export var speed : float = 30
@export var hp : float = 1

var bulletObject = load("res://object/bullet.tscn")


func addEffects(EffectList:Array):
	## add effect to the entity
	if effects == null:
		effects = []
	for elem in EffectList:
		effects.append(elem.new(self))

func call_shoot():
	## shoot
	for effect in effects :
		effect.entity = self # force update ref to entity
		effect.onShoot()

func generateBullet()-> Bullet: 
	## generate a bullet to be lanch

	# note : duplacating complex object seam very buggy in godot. 
	#	that why we make new bullet instead of duplicate it
	var bullet = bulletObject.instantiate()
	bullet.origin = origin
	bullet.global_position = global_position
	for effect in effects :
		effect.applyBallEffect(bullet)

	return bullet