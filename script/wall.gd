extends TileMap
## colision for the green line

func collide(pos:Vector2,size = 12,type = "wall",explode=false ):
	for cell in get_used_cells(0):
		var cell_pos = Vector2(
			cell.x * scale.x + global_position.x,
			cell.y * scale.y + global_position.y
		)

		if type == "wall":
			if pos.distance_to(cell_pos) < size:
				erase_cell(0,cell)
			elif explode and pos.distance_to(cell_pos) < 12 and randi_range(0,1) == 1:
				erase_cell(0,cell)
	
		elif type == "greenLine":
			if pos.distance_to(cell_pos) < size and cell.x % 2 == 0:
				erase_cell(0,cell)
