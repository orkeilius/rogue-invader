extends Node2D
## basic alien group 
##
## the level add more alien


var alien = load("res://object/alien/AlienBase.tscn")
var direction = 1
@export var level = -1
@export var speed :float
@export var speedBoost: float

var sizeX = 11
var sizeY = 5
var currentSpeed = 0
@onready var basePosition = position

var hpLevel = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if level == -1:
		position.y += get_node("/root/GameData").level * 10
	else:
		sizeY = (level - 5 )% 5 + 5
		var effectLevel = ceil((level - 5) /5)
		var speedLevel = randi_range(0,effectLevel)
		hpLevel = effectLevel - speedLevel

		speed *= 1 + speedLevel * 0.75
	 


	for j in range(sizeY):
		for i in range(sizeX):
			var newAlien = alien.instantiate()
			newAlien.sprite_variante = floor( (j + 1 )/2 ) % 3
			newAlien.position.x = 40 * i
			newAlien.position.y = 45 * j
			newAlien.hp += hpLevel
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
	
	if len(get_children()) == 0:
		find_parent("gameInfo").nextLevel()
		return

	if (20 - getChildPosX().min() >  position.x):
		position.y += 20
		direction = 1
		position.x += delta * direction * currentSpeed

	elif (position.x + getChildPosX().max() > 570):
		position.y += 20
		direction = -1
		position.x += delta * direction * currentSpeed
