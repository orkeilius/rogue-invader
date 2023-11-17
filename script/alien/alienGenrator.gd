extends Node2D


var enemieLevel =[ 
    {object= load("res://object/alien/groupAlien.tscn") ,level = 0,cost = 11}
]

func _ready():
    var level = get_node("/root/GameData").level 
    var point = level * 5 + 50

    while point > 0:
        var val = randi_range(0,len(enemieLevel) -1)
        point -= enemieLevel[val].cost
        enemieLevel[val].level += 1


    