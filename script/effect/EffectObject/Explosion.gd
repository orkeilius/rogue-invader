extends Node2D

var origin = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.25).timeout
	call_deferred("free")

func _on_body_entered(body):
	if body.is_in_group("wall"):
		body.collide(global_position,20,"wall",true)


func _on_area_entered(target):
	if target.is_in_group("alien") :
		if target.hp < 0:
			return
		target.hp -= 1
		target.callUpdateBullet()
