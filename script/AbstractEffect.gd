class_name AbstractEffect

# you can only overwrite method in gdscript
var level:int = 1 
var entity: AbstractEffectEntity

func _init(entity_: AbstractEffectEntity):
    entity = entity_

func info() -> Dictionary :
    return {}

func addLevel(addedLevel):
    level += addedLevel
    applyLevelUp(addedLevel)

func applyLevelUp(addedLevel):
    #call when level is updated
    pass 

func onEffect():
    # when effect is added
    pass

func applyBallEffect(bullet:Bullet):
    # add effect to bullet before shoot
    pass
        
func onShoot(emiter:Node2D) :
    # when shoot
    pass      

func moveBullet(speed:float,bullet:Bullet):
    # bullet mouvement
    pass
