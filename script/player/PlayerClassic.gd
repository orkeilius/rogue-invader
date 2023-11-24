extends Node2D

@export var speed : float = 30
@export var edgeLimit : int = 10
@export var shootTimeout : float = 1.25

@onready var gameScene = find_parent("gameInfo")
var currentShootTimeout = 0
var bulletObject = load("res://object/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	addEffects([ShotUp,MoveNormal])
	origin = "player"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left") and (position.x - edgeLimit > 0) :
		direction = -1
	if Input.is_action_pressed("ui_right") and (position.x + edgeLimit < ProjectSettings.get("display/window/size/viewport_width")) :
		direction = 1

	position.x += direction * speed * delta 

	currentShootTimeout -= delta
	if Input.is_action_pressed("shoot") and currentShootTimeout <= 0:
		print(effects[0].name)
		currentShootTimeout = shootTimeout
		print()
		call_shoot()
		
