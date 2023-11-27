extends gamemodeAbstract
## gamemode for classic game

# Called when the node enters the scene tree for the first time.
func _ready():
	find_child("HighScore").text = "%05d" % globalData.highscore[0][0].score
	_set_score(globalData.score)
	globalData.gamemode = 0

func nextLevel():
	globalData.level += 1
	get_tree().change_scene_to_file("res://scene/gameMode/gamemodeClassic.tscn")

func gameOver():
	globalData.action = "setScore"
	get_tree().change_scene_to_file("res://scene/UI/SpaceInvadersMenu/highscoreMenu.tscn")
