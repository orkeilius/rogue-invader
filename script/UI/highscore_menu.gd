extends Control
## highscore menu

@onready var globalData = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():

	if globalData.action == "setScore":
		globalData.action = ""
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
	
	for i in range(min(12,len(globalData.highscore) -1 )):
		var line = scoreList.get_child(i)
		line.get_node("Label").text = globalData.highscore[i].name
		line.get_node("Label2").text = "%010d" % globalData.highscore[i].score

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scene/UI/main_menu.tscn")
