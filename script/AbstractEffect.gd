class_name AbstractEffect

# you can only overwrite method in gdscript

func info() -> Dictionary :
    return {}


func onEffect():
    # when effect is added
    pass

func applyBallEffect(bullet:Bullet) -> Bullet:
    # add effect to bullet before shoot
    return bullet
        
func onShoot(bullet:Bullet,emiter:Node2D) :
    # shoot
    pass      

func moveBullet(speed:float,bullet:Bullet):
    # bullet mouvement
    pass 