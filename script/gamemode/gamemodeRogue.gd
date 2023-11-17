extends gamemodeAbstract

# Called when the node enters the scene tree for the first time.
func _ready():
	globalData.player.position = Vector2(300,635)
	add_child(globalData.player)


	find_child("HighScore").text = "%05d" % globalData.highscore[0].score
	_set_score(globalData.score)

func nextLevel():
	globalData.level += 1
	get_tree().change_scene_to_file("res://scene/gameMode/gamemodeRogue.tscn")

func gameOver():
	globalData.action = "setScore"
	get_tree().change_scene_to_file("res://scene/UI/SpaceInvadersMenu/highscoreMenu.tscn")
