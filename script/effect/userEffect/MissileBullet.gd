class_name MissileBullet extends AbstractEffect
## effect use to move bullet forward

const name = "missile bullet"

func applyBallEffect(bullet:Bullet):
	# add effect to bullet before shoot
	bullet.effects.append(MissileBullet.new(entity))
	
func moveBullet(speed:float,bullet:Bullet):
	bullet._AnimatedSprite2D.modulate.a = (sin(Time.get_unix_time_from_system() * 10) + 1) * 0.25 + 0.5
	bullet.speed *= 0.75

func onBulletDied(bullet):
	var explosion = load("res://object/effect/explosion.tscn").instantiate()
	explosion.position = bullet.position
	explosion.scale = Vector2.ONE * 3
	explosion.origin = bullet.origin
	bullet.find_parent("gameInfo").add_child(explosion)

		
