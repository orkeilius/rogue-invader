class_name FasterShoot extends AbstractEffect

const name = "faster speed"

var previousSpeed = 1

func setSpeed():
	var newSpeed =  0.5 ** level

	entity.shootTimeout *= 1/ previousSpeed
	entity.shootTimeout *= newSpeed

	previousSpeed = newSpeed


func _init(entity_: AbstractEffectEntity):
	super._init(entity_)
	setSpeed()


func applyLevelUp(_level):
	setSpeed()
	#call when level is updated
	
