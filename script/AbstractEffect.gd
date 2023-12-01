class_name AbstractEffect
## abstract class to make effect

# note: you can only overwrite method in gdscript
# const name

## effect level
var entity: AbstractEffectEntity


func _init(entity_: AbstractEffectEntity):   
    entity = entity_
    applyInit()

func applyInit():
    ## call when initated
    pass

func applyLevelUp(addedLevel : int):
    ## call when level is updated
    pass 

func applyBallEffect(bullet:Bullet):
    ## call to add effect to bullet before shoot
    pass
        
func onShoot() :
    ## call when shooting
    pass      

func moveBullet(speed:float,bullet:Bullet):
    ## call to handle bullet movement
    pass

func onBulletCollide(bullet:Bullet, colider:Node2D):
    ## call when bullet touche something
    pass

func onBulletDied(bullet:Bullet):
    ## call when bullet is destroy
    pass