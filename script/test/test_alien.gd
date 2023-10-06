extends Node

var alien = load("res://object/alien/AlienBase.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(10):
		for i in range(20):
			var newAlien = alien.instantiate()
			newAlien.sprite_variante = randi_range(1,3)
			newAlien.position.x = 40 * i
			newAlien.position.y = 40 * j
			add_child(newAlien)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
