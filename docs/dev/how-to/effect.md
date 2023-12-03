# how effect work
## what is an effect
an effect is a godot script who is call to apply different modification (exemple : change stat, move bullet or shoot in different angle)

## how the effect system work
![](../../asset/effect_system.png)

0. the effect is set in the entity or listed in the list of givable item
1. the effect is given to an entity in the entity code or in the effect menu
2. *some* effect apply itself the bullet (ex: effect to move the bullet)
3. *some* effect also apply it self to the enemy (ex : burning effect)


## make effect

there is the minimal code of an effect
```gdscript
class_name effectName extends AbstractEffect

const name = "effect name"
```
from here you can add various function 

##### exemple:
```gdscript
func onShoot(entity:Node2D):
	var bullet = entity.generateBullet()
	bullet.rotation_degrees = 90
	bullet.global_position = entity.global_position
	entity.find_parent("gameInfo").add_child(bullet)
```
this code make the entity shoot on the side see the function list for more information

### add you effect to the game
if the effect is for the player add the class in `listOfGivableItem.gd`

if it used in a other way use the `addEffets()` of the `AbstractEffectEntity`

## helper methods
these fucntion can't help you while making effect :
### entity.generateBullet()
> **return :** Bullet object
 
generate a bullet with effect, use this to shot it

## effect methods
effect that can be overwrite start with "apply"

### applyInit()
call when the effect is initialised

### applyBallEffect():
> **argument :** bullet : bullet object

call to add effect to bullet before shoot
```gdscript
# MorePierce.gd
func applyBallEffect(bullet:Bullet):
	bullet.pierce += level * 2
```	
### onShoot() :
call when shooting

### moveBullet():
> **argument :** speed : float | bullet : bullet object

call to handle bullet movement
```gdscript
# MoveNormal.gd
func moveBullet(speed:float,bullet:Bullet):
	bullet.position += Vector2.UP.rotated(bullet.rotation) * speed
```

### onBulletCollide
> **argument :** bullet:Bullet | colider:Node2D

call when bullet touche something


### onBulletDied
> **argument :** bullet:Bullet

call when bullet is destroy
you can use `bullet.doNotFree = true` to cancel the destruction (freeing in godot) of the bullet

```gdscript
# MissileBullet.gd
func onBulletDied(bullet):
	var explosion = load("res://object/effect/explosion.tscn").instantiate()
	explosion.position = bullet.position
	explosion.scale = Vector2.ONE * 3
	explosion.origin = bullet.origin
	bullet.find_parent("gameInfo").add_child(explosion)		
```