# bullet
the bullet/projectile heavily rely on effect to work (for movement by exemple).

it get it effect in the [generateBullet() of the abtract effect entity](<abtract effect entity.md>) and use bullet specific hook (see [abstract effect](<../effect system/abstract effect.md>))



### collision
the `origin` variable avoid to it emiter entity by cheking if the collider group is the same as `origin`

it handle the collision with alien to avoid un sync data (it remove hp corresponding to bullet pierce and vise-versa)

when a the `deleteBullet()` is call, effect can negate it by setting `doNotFree`  to true