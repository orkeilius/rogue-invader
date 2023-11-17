extends Control

var _listOfGivableItem = listOfGivableItem.new()
var buttonList = []

@onready var globalData :GameData = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	var effectList:Array = _listOfGivableItem.Effects

	if globalData.player == null:
		var playerAsset = load("res://object/player/PlayerClassic.tscn")
		var playerObject = playerAsset.instantiate()
		globalData.player = playerObject

	for i in range(3):
		buttonList.append(effectList.pop_at(randi_range(0,len(effectList) -1)))
	find_child("effect1").text = buttonList[0].name
	find_child("effect2").text = buttonList[1].name
	find_child("effect3").text = buttonList[2].name
		
func choose(value:int):
	globalData.player.addEffects([buttonList[value]])
	get_tree().change_scene_to_file("res://scene/gameMode/gamemodeRogue.tscn")


func Effect1():
	choose(0)

func Effect2():
	choose(1)

func Effect3():
	choose(2)
