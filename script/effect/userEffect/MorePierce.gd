class_name MorePierce extends AbstractEffect


const name = "more pierce"

func applyBallEffect(bullet:Bullet) -> Bullet:
	bullet.pierce += level * 2
	# add effect to bullet before shoot
	return bullet

