extends AbstractEffectEntity

@export var spriteSpeed = 1
@export var sprite_variante: int 
@export var shootRandom = 20

@onready var _AnimatedSprite2D = $AnimatedSprite2D
@onready var player = find_parent("gameInfo") .get_node("PlayerClassic")
var currentShootTimeout = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	shootTimeout = 3
	addEffects([ShootDown,MoveNormal, RandomAlienBullet])
	_AnimatedSprite2D.sprite_frames = load(
		'res://sprite/alien/base{variante}.tres'
		.format({"variante":sprite_variante})
	)
	_AnimatedSprite2D.play("default")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_AnimatedSprite2D.speed_scale = spriteSpeed
	

	currentShootTimeout -= delta
	if currentShootTimeout <= 0:
		currentShootTimeout = randf_range(0,shootTimeout)
		if randi_range(1,shootRandom) == 1:
			var distanceFromPlayer = abs(player.global_position.x - global_position.x ) 
			if distanceFromPlayer < 100:
				call_shoot("alien")
		



		
func _on_area_2d_area_entered(target : Area2D):
	if target.is_in_group("bullet") and not (target.origin == "alien"):
		
		find_parent("gameInfo").score +=  (3 - sprite_variante) * 10
		set_deferred("monitorable",false)
		set_deferred("monitoring",false)

		_AnimatedSprite2D.sprite_frames = load('res://sprite/alien/baseExplosion.tres')
		var new_parent = find_parent("gameInfo")
		var pos = global_position
		get_parent().call_deferred("remove_child",self)
		new_parent.call_deferred("add_child",self)
		set_deferred("global_position",pos)
		
		await get_tree().create_timer(0.25).timeout
		call_deferred("free")


func _on_body_entered(body):
	if body.is_in_group("wall"):
		find_parent("gameInfo").gameOver()

