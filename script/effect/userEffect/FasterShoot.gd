class_name FasterShoot extends AbstractEffect
## effect to shoot faster

const name = "faster speed"


func applyInit():
	entity.shootTimeout *= 0.7
	
