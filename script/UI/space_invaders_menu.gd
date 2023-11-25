extends Control
## classic space invaders menu
var timer_timeout = false

var message = "insert coin

<1 or 2 players>"

var typing_speed = .1
var read_time = 2

var display = ""
var current_char = 0

func _ready():
	$SceneTimer.start()
	start_dialogue()

func _process(delta):
	if Input.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scene/UI/main_menu.tscn")
	
	if Input.is_action_pressed("shoot") and timer_timeout:
		get_tree().change_scene_to_file("res://scene/UI/SpaceInvadersMenu/space_invaders_tuto.tscn")

func start_dialogue():
	display = ""
	current_char = 0
	
	$next_char.set_wait_time(typing_speed)
	$next_char.start()

func stop_dialogue():
	# get_parent().remove_child(self)
	queue_free()


func _on_next_char_timeout():
	if (current_char < message.length()):
		var next_char = message[current_char]
		display += next_char
		
		$InsertCoinLabel.text = display
		current_char += 1
	else:
		$next_char.stop()


func _on_scene_timer_timeout():
	timer_timeout = true
