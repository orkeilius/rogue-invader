class_name RandomAlienBullet extends AbstractEffect
# you can only overwrite method in gdscript

func info() -> Dictionary :
    return {}

func applyBallEffect(bullet:Bullet):
    bullet.sprite = load(
        'res://sprite/bullet/BulletAlien{variante}.tres'
		.format({"variante":randi_range(1,3)})
    )
    return bullet
        