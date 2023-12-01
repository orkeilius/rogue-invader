class_name BouncyShoot extends AbstractEffect

const name = "bouncy shoot"

func applyBallEffect(bullet:Bullet):
	# add effect to bullet before shoot
	bullet.effects.append(self)


func bonce(bullet:Bullet, colider:Node2D):

	var moveVector = Vector2.RIGHT.rotated(bullet.rotation)
	var space_state = bullet.get_world_2d().direct_space_state

	var query = PhysicsRayQueryParameters2D.create(bullet.position + (moveVector * -5), bullet.position + (moveVector * 5))
	var collide = space_state.intersect_ray(query)
	if len(collide) == 0:
		return
	bullet.position -= moveVector * 5
	bullet.rotation = moveVector.bounce(collide.normal).angle()


func onBulletCollide(bullet:Bullet, colider:Node2D):
	if colider.name == "gameBorder" and bullet.global_position.y < 640:
		bullet.rotation *= -1
		bullet.doNotFree = true	
		if bullet.position.x > 590:
			bullet.position.x = 590 
		if bullet.position.x < 10:
			bullet.position.x = 10 
	elif colider.is_in_group("wall") :
		bonce(bullet, colider)
		bullet.doNotFree = true	
		bullet.pierce -= 0.5

	elif colider.is_in_group("alien"):
		bonce(bullet, colider)	
		
