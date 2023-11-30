class_name MachineGun extends AbstractEffect
## effect use to move bullet forward

const name = "machine gun"

var set = false

func applyInit():
	if entity != null:
		entity.shootTimeout *=  0.4

func applyBallEffect(bullet:Bullet):
	# add effect to bullet before shoot
	bullet.effects.append(MachineGun.new(null))

func moveBullet(speed:float,bullet:Bullet):
	if !set :
		set = true
		bullet.rotate(randf_range(-0.5,0.5))
