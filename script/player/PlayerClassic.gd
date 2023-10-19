extends Node2D

@export var speed : float = 30
@export var edgeLimit : int = 10
@export var shootTimeout : float = 1.25

@onready var gameScene = find_parent("gameInfo")
@onready var _AnimatedSprite2D = $AnimatedSprite2D
var currentShootTimeout = 0
var bulletObject = load("res://object/bullet.tscn")
var isStunt = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isStunt:
		return
	
	var direction = 0
	if Input.is_action_pressed("move_left") and (position.x - edgeLimit > 0) :
		direction = -1
	if Input.is_action_pressed("move_right") and (position.x + edgeLimit < ProjectSettings.get("display/window/size/viewport_width")) :
		direction = 1
	if Input.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scene/UI/SpaceInvadersMenu/space_invaders_menu.tscn")

	position.x += direction * speed * delta 

	currentShootTimeout -= delta
	if Input.is_action_pressed("shoot") and currentShootTimeout <= 0:
		currentShootTimeout = shootTimeout
		var bullet = bulletObject.instantiate()
		bullet.origin = "player"
		for effect in gameScene.effects :
			effect.applyBallEffect(bullet)

		for effect in gameScene.effects :
			effect.onShoot(bullet,self)

func _on_area_2d_area_entered(target : Area2D):
	if target.is_in_group("alien"):
		get_tree().change_scene_to_file("res://scene/UI/main_menu.tscn")

	if target.is_in_group("bullet"):
		if target.origin == "player":
			return
		gameScene.hp -= 1
		
		_AnimatedSprite2D.sprite_frames = load("res://sprite/player/classicHit.tres")
		_AnimatedSprite2D.play("default")
		isStunt = true

		await get_tree().create_timer(1.5).timeout

		if gameScene.hp == 0:
			get_tree().change_scene_to_file("res://scene/UI/main_menu.tscn")

		position.x = 300
		isStunt = false
		_AnimatedSprite2D.sprite_frames = load("res://sprite/player/classic.tres")
		
