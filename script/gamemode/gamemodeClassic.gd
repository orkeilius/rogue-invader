extends Node

@onready var globalData :GameData = get_node("/root/GameData")

var effects = [ShootUp.new(),MoveNormal.new()] 
var hp = 3: set = _set_hp
var _score = [0,0]
var score :int : set = _set_score, get = _get_score
var player = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	print(globalData)
	find_child("HighScore").text = "%05d" % globalData.highscore[0].score
	_set_score(globalData.score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _set_hp(new_value: int) -> void:
	hp = new_value
	find_child("HP").text = str(hp)


func _set_score(new_value : int) -> void:
	_score[player] = new_value
	globalData.score = new_value
	find_child("Score1").text = "%05d" % _score[0]
	find_child("Score2").text = "%05d" % _score[1]

func _get_score() -> int:
	return _score[player]

func nextLevel():
	globalData.level += 1
	get_tree().change_scene_to_file("res://scene/gameMode/gamemodeClassic.tscn")

func gameOver():
	Engine.time_scale = 0
	await globalData.set_score("",globalData.score)
	Engine.time_scale = 1
	globalData.score = 0
	get_tree().change_scene_to_file("res://scene/UI/main_menu.tscn")
