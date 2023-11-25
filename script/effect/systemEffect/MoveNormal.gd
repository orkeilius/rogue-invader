class_name MoveNormal extends AbstractEffect
## effect use to move bullet forward

const name = "move normal"

func applyBallEffect(bullet:Bullet):
	# add effect to bullet before shoot
	bullet.effects.append(self)

func moveBullet(speed:float,bullet:Bullet):
	bullet.position += Vector2.UP.rotated(bullet.rotation) * speed
