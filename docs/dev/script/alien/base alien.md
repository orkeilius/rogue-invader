# Basic alien
Alien extended from [abstract effect entity](<abstract effect entity.md>)

He doesn't move because it's handled by [group alien](<../alien/group alien.md>)

#### IA
Its only shot when near the player on the x-axis

#### Collision
The alien don't handle the collision with the bullet because we need to update data on both side that interact with its other. So to avoid un-sync data collision is handle on the bullet who call the 'callUpdateBullet()' afterward.
