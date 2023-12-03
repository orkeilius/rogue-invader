# effect system
the effect system is one of the most important system of the project  
it use to handle every shoot realated code and effect obtainable by player  

## how effect work
the effect is made a list of functions use as hook call by other entity [for more information look at abstract effect](<abstract effect.md>)

>#### Exemple :
> ```gdscript
># [bullet.gd]()
>func _process(delta):
>	for effect in effects :
>		effect.moveBullet(speed* delta,self)
>```
> the bullet script the call every movebullet() of his effects
>```gdscript
># MoveNormal.gd
>func moveBullet(speed:float,bullet:Bullet):
>	bullet.position += Vector2.UP.rotated(bullet.rotation) * speed
>
>```
> the moveNormal effect move the bullet forward  

this way a script can be easely replace/Added that will change this behavior

## effect entity
effect are use by two class : abstract entity and bullet
### [abstract entity](<abstract effect.md>) 
this an absctrac class use by [alien]() and [player]() and offer some utils function and variable to be modified more easily by effect
### [bullet]()
the bullet is his own effect hook (like moveBullet())

## effect lifecycle
![](../../../asset/effect_system.png)

0. the effect is set in the entity or listed in the list of givable item and added in the [effect menu]()
1. the effect is given to an entity in the entity code or in the effect menu
2. *some* effect apply itself the bullet (ex: effect to move the bullet)
3. *some* effect also apply it self to the enemy (ex : burning effect)

### user vs system effect
if you look at the code structure you can see three folder in the effect folders on is for object load by effect and other are for 2 type of script
- **player effect** : Effect give by the player. There listed in the `listOfGivableItem.gd` class so the game know with effect to choose from

- **system effect** : default effect set using the `addEffets()` in the ready() of an extended [AbstractEffectEntity]()