class_name cornerShoot extends AbstractEffect
## effect to shoot down
const name = "corner shot"

i = 0

func onShoot(entity:Node2D):
	if i == 0:
		var bullet = entity.generateBullet()
		bullet.rotation_degrees = 45
		entity.find_parent("gameInfo").add_child(bullet)
		var bullet = entity.generateBullet()
		bullet.rotation_degrees = -45
		entity.find_parent("gameInfo").add_child(bullet)

	i = (i + 1) % 2