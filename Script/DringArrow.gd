extends Sprite

var my_size = get_rect().size

func do_update(dir_dring:Vector2, dring_distance:float):
	if dring_distance > 120:
		if !visible:
			visible = true

		position = dir_dring * 120
		
		rotation = -dir_dring.angle_to(Vector2.UP)
	elif visible:
		visible = false
