class_name MissileBullet extends AbstractEffect
## effect use to move bullet forward

const name = "missile bullet"

var previousSpeed = 1
var set = false

func setValue():
	var newSpeed =  0.4 ** level

	entity.shootTimeout *= 1/ previousSpeed
	entity.shootTimeout *= newSpeed

	previousSpeed = newSpeed


func applyInit():
	setValue()

func applyLevelUp(_level):
	setValue()

func applyBallEffect(bullet:Bullet):
	# add effect to bullet before shoot
	bullet.effects.append(MachineGun.new(entity))

func moveBullet(speed:float,bullet:Bullet):
	if !set :
		set = true
		bullet.rotate(randf_range(-0.5,0.5))
