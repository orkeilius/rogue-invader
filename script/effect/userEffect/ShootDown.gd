class_name ShootDown extends AbstractEffect

const name = "shot down"


func onShoot(entity:Node2D):
	var bullet = entity.generateBullet()
	bullet.rotation_degrees = 180
	bullet.global_position = entity.global_position
	entity.find_parent("gameInfo").add_child(bullet)

