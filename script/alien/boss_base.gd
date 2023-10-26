extends Area2D


@export var speed = 90
@export var timeout = 5
@export var timeoutAfterRun = 20
@export var randonRun = 3
@export var pointTable = [50,50,50,50,100,100,100,150,150,300]

@onready var _AnimatedSprite2D = $AnimatedSprite2D


var running = false
var stunt = false
var currentTimeout = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if stunt:
		return

	if running:
		position.x += speed * delta
		
		if position.x >= 632:
			running = false
			position.x = -32
			currentTimeout = timeoutAfterRun
	
	else:
		currentTimeout -= delta

		if currentTimeout <= 0:
			currentTimeout = timeout

			if randi_range(1,randonRun) == 1:
				running = true 

func _on_area_entered(target:Area2D):
	if target.is_in_group("bullet") and not (target.origin == "alien"):
		stunt = true
		find_parent("gameInfo").score += pointTable[ randi_range(0,len(pointTable) -1) ]
		set_deferred("monitorable",false)
		set_deferred("monitoring",false)
		_AnimatedSprite2D.sprite_frames = load('res://sprite/alien/bossExplosion.tres')

		await get_tree().create_timer(0.25).timeout

		stunt = false
		position.x = -32
		set_deferred("monitorable",true)
		set_deferred("monitoring",true)
		_AnimatedSprite2D.sprite_frames = load('res://sprite/alien/boss.tres')
		currentTimeout = timeoutAfterRun