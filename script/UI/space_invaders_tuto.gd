extends Control
## space invaders tutorial

var scenetimer_timeout = false

var messages = ["=? mystery", "=30 points", "=20 points", "=10 points"]
var typing_speed = .1
var read_time = 2

var display = ""
var current_char = 0

var current_message = 0

func _ready():
	$SceneTimer.start()
	start_dialogue()

func _process(delta):
	if Input.is_action_pressed("shoot") and scenetimer_timeout:
		get_node("/root/GameData").launchGame("res://scene/gameMode/gamemodeClassic.tscn")
	elif Input.is_action_just_pressed("escape") and scenetimer_timeout:
		get_tree().change_scene_to_file("res://scene/UI/SpaceInvadersMenu/space_invaders_menu.tscn")


func _on_scene_timer_timeout():
	scenetimer_timeout= true

func start_dialogue():
	display = ""
	current_char = 0
	current_message = 0
	
	$next_char.set_wait_time(typing_speed)
	$next_char.start()

func stop_dialogue():
	queue_free()

func _on_next_char_timeout():
	if current_message == 4:
		$next_char.stop()
	elif (current_char < messages[current_message].length()):
		var next_char = messages[current_message][current_char]
		display += next_char
		$VBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer.get_child(current_message).text = display
		current_char += 1
	elif (current_char==messages[current_message].length()):
		display = ""
		current_char = 0
		current_message += 1
