class_name RandomAlienBullet extends AbstractEffect
# you can only overwrite method in gdscript

const name = "random alien sprite"

func applyBallEffect(bullet:Bullet):
    bullet.sprite = load(
        'res://sprite/bullet/BulletAlien{variante}.tres'
		.format({"variante":randi_range(1,3)})
    )
    return bullet
        