class_name AbstractEffect
## abstract class to make effect

# note: you can only overwrite method in gdscript
# const name

## effect level
var level:int = 1
var entity: AbstractEffectEntity


func addLevel(addedLevel):
    ## add level
    ## don't overwrite
    level += addedLevel
    applyLevelUp(addedLevel)


func _init(entity_: AbstractEffectEntity):
    ## call when initated
    entity = entity_


func applyLevelUp(addedLevel):
    ## call when level is updated
    pass 

func applyBallEffect(bullet:Bullet):
    ## call to add effect to bullet before shoot
    pass
        
func onShoot(emiter:Node2D) :
    ## call when shooting
    pass      

func moveBullet(speed:float,bullet:Bullet):
    ## call to handle bullet movement
    pass
