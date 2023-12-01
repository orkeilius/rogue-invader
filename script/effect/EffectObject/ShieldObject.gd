extends Area2D


func _on_area_entered(target : Area2D):
	if target.is_in_group("bullet") and target.origin == "alien":
		call_deferred("free")
 
