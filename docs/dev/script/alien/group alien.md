# Group alien
An object to handle a group of alien.

It moves every [alien]() he had and "bonce" when an alien is near the borders.

Also, he trigger [`nextLevel`of gamemode]() when every alien is dead.

When initialized, he generates a row of enemies.
### In rogue-invader
It uses the given level from [alien generator]() when on rogue mode.  
Depending on the level, it generates more line and gives more live or speed.

### In classic-invaders
He use the level global when on classic mode (because it is the only enemies on the map).

Depending on the level, it moves downward (like in the original game).