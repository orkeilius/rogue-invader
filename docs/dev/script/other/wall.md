# wall
a class to handle [tilemap](https://docs.godotengine.org/fr/4.x/tutorials/2d/using_tilemaps.html) in the game (the walls and the green line)

tilemap doesn't have a collision triger so when another entity touch a wall it trigger the wall `collide()` function with argument depending the wall and what entity it it

when "trigger" the wall will remove pixel/tile by calculating how close the tile is from the entity position and given size
