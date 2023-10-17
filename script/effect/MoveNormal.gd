class_name MoveNormal extends AbstractEffect

func _init():
	pass


func info() -> Dictionary :
	return {
		"name":'Move normal'
	}

func applyBallEffect(bullet:Bullet):
	# add effect to bullet before shoot
	bullet.effects.append(self)

func moveBullet(speed:float,bullet:Bullet):
	bullet.position += Vector2.UP.rotated(bullet.rotation) * speed
