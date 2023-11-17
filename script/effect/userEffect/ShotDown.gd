class_name ShootDown extends AbstractEffect

const name = "shot down"


func onShoot(bullet:Bullet,entity:Node2D):
	bullet.rotation_degrees = 180
	bullet.global_position = entity.global_position
	bullet.effects.append(self)
	entity.find_parent("gameInfo").add_child(bullet)
	pass       


