class_name ShootDown extends AbstractEffect
## effect to shoot down
const name = "shot down"


func onShoot():
	var bullet = entity.generateBullet()
	bullet.rotation_degrees = 180
	entity.find_parent("gameInfo").add_child(bullet)

