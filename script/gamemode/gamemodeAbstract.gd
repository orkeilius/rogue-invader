class_name gamemodeAbstract extends Node

@onready var globalData :GameData = get_node("/root/GameData")

var _score = [0,0]
var score :int : set = _set_score, get = _get_score
var player = 0
var hp = 3: set = _set_hp

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
