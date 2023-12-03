# abstract effect
the abstract effect is the core of the effect system it set the function/hook call by entity and overwrite by effect 
for more information look at the [effect system](<effect system.md>)

>##### exemple:
>```gdscript
>func onShoot(entity:Node2D):
>	var bullet = entity.generateBullet()
>	bullet.rotation_degrees = 90
>	bullet.global_position = entity.global_position
>	entity.find_parent("gameInfo").add_child(bullet)
>```
>this code make the entity shoot on the side see the hook list for more information

also user effect have a name variable (not declared in abstract classe because you can't overwrite variable)

## list of hook

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