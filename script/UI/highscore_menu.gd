extends Control
## highscore menu

@onready var globalData = get_node("/root/GameData")
var gamemode = 0

# Called when the node enters the scene tree for the first time.
func _ready():

	if globalData.action == "setScore":
		globalData.action = ""
		gamemode = globalData.gamemode
		var nameEntry = find_child("nameEntry")		
		find_child("nameMenu").visible = true
		nameEntry.grab_focus()

		await nameEntry.text_submitted

		await globalData.set_score(nameEntry.text.to_upper(),globalData.score)
	
	find_child("backButton").grab_focus()
	find_child("nameMenu").visible = false
	show_score()

func show_score():
	var scoreList = find_child("scoreList")

	if gamemode == 0:
		find_child("gamemode").text = "retro-invaders"
	else:
		find_child("gamemode").text = "rogue-invaders"	

	
	for i in range(12):
		var line = scoreList.get_child(i)
		if i < len(globalData.highscore[gamemode]):
			line.get_node("Label").text = globalData.highscore[gamemode][i].name
			line.get_node("Label2").text = "%010d" % globalData.highscore[gamemode][i].score
		else:
			line.get_node("Label").text = ""
			line.get_node("Label2").text = ""	

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scene/UI/main_menu.tscn")


func _on_back_switch_pressed():
	gamemode = (gamemode + 1) %2
	show_score()
