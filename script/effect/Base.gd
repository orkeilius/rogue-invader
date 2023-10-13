class_name baseEffect extends AbstractEffect

func _init():
	pass


func info() -> Dictionary :
	return {
		"name":'base'
	}


func onShoot(bullet:Bullet,entity:Node2D):
	bullet.rotation_degrees = 0
	bullet.position = entity.position
	entity.get_parent().add_child(bullet)
	pass       

func moveBullet(speed:float,bullet:Bullet):
	bullet.translate(Vector2.UP * speed)
