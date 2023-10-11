extends Node2D

var alien = load("res://object/alien/AlienBase.tscn")
var direction = 1

@export var speed :float
# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(5):
		for i in range(11):
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
	var screen = ProjectSettings.get_setting("display/window/size/viewport_width")
	position.x += delta * direction * speed
	
	if (0 > position.x) or (position.x + getChildPosX().max() > 565):
		position.y += 20
		direction *= -1
	
