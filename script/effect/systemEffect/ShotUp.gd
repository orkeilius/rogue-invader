extends AbstractEffect

const name = "shot up"


func onShoot(bullet:Bullet,entity:Node2D):
	bullet.rotation_degrees = 0
	bullet.global_position = entity.global_position
	bullet.effects.append(self)
	entity.find_parent("gameInfo").add_child(bullet)
