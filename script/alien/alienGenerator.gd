extends Node2D
## singleton to generate alien
##
## it use the nb level to set cost and res of each alien

const enemieData =[ 
	{object= "res://object/alien/groupAlien.tscn" ,cost = 11}
]
var enemielevel = [0]

func _ready():
	var level = get_node("/root/GameData").level 
	var point = level * 5 + 50

	while point > 0:
		var val = randi_range(0,len(enemieData) -1)
		print(val)
		point -= enemieData[val].cost
		enemielevel[val] += 1
	
	for nb in range(len(enemieData)):
		if enemielevel[nb] == 0:
			continue
			
		var object = load(enemieData[nb].object).instantiate()
		object.level = enemielevel[nb]
		add_child(object)
		
