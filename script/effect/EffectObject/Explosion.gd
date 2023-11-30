extends Node

var origin = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.25).timeout
	call_deferred("free")
