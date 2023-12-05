# Abstract effect entity

Abstract entity is an abstraction made to handle effect related call for entity and provide utils function for effect.
Also, it holds variable use modified by effect.


## Function
- **addEffect** : add list of effect to the entity
- **callshoot** : call by entity to shoot
- **generateBullet** : call by script to get a bullet with its effect (duplicate instanced object doesn't work in godot).