extends Node2D

@onready var _AnimatedSprite2D = $AnimatedSprite2D
@onready var _Area2D = $Area2D
@export var spriteSpeed = 1
@export var sprite_variante: int 

# Called when the node enters the scene tree for the first time.
func _ready():
	_AnimatedSprite2D.sprite_frames = load(
		'res://sprite/alien/base{variante}.tres'
		.format({"variante":sprite_variante})
	)
	_AnimatedSprite2D.play("default")
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_AnimatedSprite2D.speed_scale = spriteSpeed


func _on_area_2d_area_entered(target : Area2D):
	if target.is_in_group("bullet"):
		_Area2D.queue_free()
		_AnimatedSprite2D.sprite_frames = load('res://sprite/alien/baseExplosion.tres')
		var new_parent = get_parent().get_parent()
		var pos = global_position
		get_parent().remove_child(self)
		new_parent.add_child(self)
		global_position = pos
		
		await get_tree().create_timer(0.25).timeout
		queue_free()
