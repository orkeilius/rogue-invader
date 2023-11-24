class_name RandomAlienBullet extends AbstractEffect
## effect to set random alien's sprite to bullet

const name = "random alien sprite"

func applyBallEffect(bullet:Bullet):
	bullet.sprite = load(
		'res://sprite/bullet/BulletAlien{variante}.tres'
		.format({"variante":randi_range(1,3)})
	)
	return bullet
		
