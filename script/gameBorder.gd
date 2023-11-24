extends Area2D
## script to redirect colisiondetection to greenline
##
## tilemap have hit box but don't have trigger 

@onready var greenLine = find_child("greenLine")

func _on_area_entered(area):
	greenLine.collide(area.global_position)
