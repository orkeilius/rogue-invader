extends ParallaxBackground

@export var scrolling_speed :float = 500.0

func _process(delta):
	self.scroll_offset.y += scrolling_speed * delta
