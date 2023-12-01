class_name Shield extends AbstractEffect

const name = "shield"

func applyInit():
	var shield = load("res://object/effect/ShieldObject.tscn")
	var new_shield = shield.instantiate()
	entity.add_child(new_shield)
