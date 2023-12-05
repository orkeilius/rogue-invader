# Bullet
The bullet/projectile heavily rely on effect to work (for movement by example).

It gets it effect in the [generateBullet() of the abstract effect entity](<abstract effect entity.md>) and use bullet specific hook (see [abstract effect](<../effect system/abstract effect.md>)).



### collision
The `origin` variable avoid hitting the emitter entity by checking if the collider group is the same as `origin`.

It handles the collision with alien to avoid un-sync data (it removes hp corresponding to bullet pierce and vice versa).

When an `deleteBullet()` is called, effect can negate it by setting `doNotFree`  to true.
