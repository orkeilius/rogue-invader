class_name ShootUp extends AbstractEffect
## effect to shoot up
const name = "shoot up"


func onShoot(entity:Node2D):
	var bullet = entity.generateBullet()
	bullet.rotation_degrees = 0
	entity.find_parent("gameInfo").add_child(bullet)
