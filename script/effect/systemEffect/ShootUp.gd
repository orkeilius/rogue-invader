class_name ShootUp extends AbstractEffect
## effect to shoot up
const name = "shoot up"


func onShoot(entity:Node2D):
	var bullet = entity.generateBullet()
	bullet.rotation_degrees = 0
	bullet.global_position = entity.global_position
	entity.find_parent("gameInfo").add_child(bullet)
