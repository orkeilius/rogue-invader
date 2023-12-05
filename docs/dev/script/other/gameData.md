# gameData
Godot use a singleton system to share data between scene ([godot wiki](https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html))  

in the game we use the gamaData for this, its hold the following data :
- level
- action (for high menu to know if it need to send score)
- highscore
- player (player data and effect for rogue-invaders )
- gamemode
- list of currently givable item (for rogue-inviders)

it also handle database connection 