extends Node2D

@export var spriteSpeed = 1
@export var sprite_variante: int 
@onready var _CollisionShape2d = $CollisionShape2D
@export var shootTimeout : float = 3
@export var shootRandom = 20

@onready var _AnimatedSprite2D = $AnimatedSprite2D
@onready var player = find_parent("gameInfo") .get_node("PlayerClassic")
var bulletObject = load("res://object/bullet.tscn")
var currentShootTimeout = 0


var effects = [ShootDown.new(),MoveNormal.new(), RandomAlienBullet.new()]

# Called when the node enters the scene tree for the first time.
func _ready():
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
				var bullet = bulletObject.instantiate()
				bullet.origin = "alien"
				for effect in effects :
					effect.applyBallEffect(bullet)
				
				for effect in effects :
					effect.onShoot(bullet,self)



		
func _on_area_2d_area_entered(target : Area2D):
	if target.is_in_group("bullet"):
		if target.origin == "alien":
			return
		
		queue_free()
		return

		_AnimatedSprite2D.sprite_frames = load('res://sprite/alien/baseExplosion.tres')
		var new_parent = get_parent().get_parent()
		var pos = global_position
		get_parent().remove_child(self)
		new_parent.add_child(self)
		global_position = pos
		
		await get_tree().create_timer(0.25).timeout
		queue_free()
