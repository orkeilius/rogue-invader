# Wall
a class to handle [tile map](https://docs.godotengine.org/fr/4.x/tutorials/2d/using_tilemaps.html) in the game (the walls and the green line) made of tile that we use as a pixel on of the tile .

Tile maps don't have a collision trigger, so when another entity touch a wall it triggers the wall `collide()` function with argument depending on the wall and what entity it hit.

When "trigger" the wall will remove a pixel/tile by calculating how close the tile is from the entity position and given size.
