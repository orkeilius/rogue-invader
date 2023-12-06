# How effect work
## What is an effect
An effect is a godot script who is call to apply different modification (example : change stat, move bullet or shoot in different angle).

## How the effect system work
![](../../asset/effect_system.png)

0. The effect is set in the entity or listed in the list of givable item.
1. The effect is given to an entity in the entity code or in the effect menu.
2. *Some* effects apply itself the bullet (ex: effect to move the bullet).
3. *Some* effect also applies itself to the enemy (ex : burning effect).


## Make effect

There is the minimal code of an effect.
```gdscript
class_name effectName extends AbstractEffect

const name = "effect name"
```
From here you can add various function.

##### Example :
```gdscript
func onShoot(entity:Node2D):
	var bullet = entity.generateBullet()
	bullet.rotation_degrees = 90
	bullet.global_position = entity.global_position
	entity.find_parent("gameInfo").add_child(bullet)
```
This code make the entity shoot on the side, see the function list for more information.

### Add your effect to the game
If the effect is for the player, to add the class in `listOfGivableItem.gd`.

If it used in another way, use the `addEffets()` of the `AbstractEffectEntity`.

## Helper methods
These function can't help you while making effect :
### entity.generateBullet()
> **return :** Bullet object
 
Generate a bullet with effect, use this to shot it.

## Effect methods

### applyInit()
Call when the effect is initialized.

### applyBallEffect():
> **argument :** bullet : bullet object

Call to add effect to bullet before shoot.
```gdscript
# MorePierce.gd
func applyBallEffect(bullet:Bullet):
	bullet.pierce += level * 2
```	
### onShoot() :
Call when shooting.

### moveBullet():
> **argument :** speed : float | bullet : bullet object

Call to handle bullet movement.
```gdscript
# MoveNormal.gd
func moveBullet(speed:float,bullet:Bullet):
	bullet.position += Vector2.UP.rotated(bullet.rotation) * speed
```

### onBulletCollide()
> **argument :** bullet:Bullet | colider:Node2D

call when bullet touch something


### onBulletDied()
> **argument :** bullet:Bullet

Call when bullet is destroyed.
You can use `bullet.doNotFree = true` to cancel the destruction (freeing in godot) of the bullet.

```gdscript
# MissileBullet.gd
func onBulletDied(bullet):
	var explosion = load("res://object/effect/explosion.tscn").instantiate()
	explosion.position = bullet.position
	explosion.scale = Vector2.ONE * 3
	explosion.origin = bullet.origin
	bullet.find_parent("gameInfo").add_child(explosion)		
```