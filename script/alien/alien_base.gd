extends Node2D

@onready var _AnimatedSprite2D = $AnimatedSprite2D
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
	pass
