# Abstract effect
The abstract effect is the core of the effect system, it set the function/hook call by entity and overwrite by effect.
For more information, look at the [effect system](<effect system.md>).

>##### exemple:
>```gdscript
>func onShoot(entity:Node2D):
>	var bullet = entity.generateBullet()
>	bullet.rotation_degrees = 90
>	bullet.global_position = entity.global_position
>	entity.find_parent("gameInfo").add_child(bullet)
>```
>This code make the entity shoot on the side see the hook list below for more information.

Also, user effect have a name variable (not declared in abstract class because you can't overwrite variable).

## List of hook

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

Call when bullet touch something.


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