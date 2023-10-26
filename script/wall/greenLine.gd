extends TileMap

func collide(pos:Vector2,size = 12):
	for cell in get_used_cells(0):
		var cell_pos = Vector2(
			cell.x * scale.x + global_position.x,
			cell.y * scale.y + global_position.y
		)
		
		if pos.distance_to(cell_pos) < size and cell.x % 2 == 0:
			erase_cell(0,cell)
