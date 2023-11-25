extends ParallaxLayer

var motion = Vector2(-50, 0)
var speed = -50

# Called when the node enters the scene tree for the first time.
func _ready():
	set_mirroring(motion)

func _process(delta):
	speed -= 5
	set_motion_offset(motion + Vector2(speed, 0))
