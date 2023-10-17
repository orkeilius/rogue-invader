extends Node2D

var alien = load("res://object/alien/AlienBase.tscn")
var direction = 1

@export var speed :float
@export var speedBoost: float
var sizeX = 11
var sizeY = 5
var currentSpeed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(sizeY):
		for i in range(sizeX):
			var newAlien = alien.instantiate()
			newAlien.sprite_variante = floor( (j + 1 )/2 )
			newAlien.position.x = 40 * i
			newAlien.position.y = 45 * j
			add_child(newAlien)

func getChildPosX():
	var out = []
	for child in get_children():
		out.append(child.position.x)
	return out


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentSpeed = speed + (speedBoost * max(0,  25 - len(get_children())))
	for child in get_children():
		child.spriteSpeed = currentSpeed / 40

	position.x += delta * direction * currentSpeed
	
	var screen = ProjectSettings.get_setting("display/window/size/viewport_width")
	if (20 - getChildPosX().min()  > position.x) or (position.x + getChildPosX().max() > 570):
		position.y += 20
		direction *= -1
	
