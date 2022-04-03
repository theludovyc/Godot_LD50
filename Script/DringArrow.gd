extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rect_position -= rect_size/2
	pass # Replace with function body.

func do_update(dir_dring:Vector2, dring_distance:float):
	if dring_distance > 120:
		if !visible:
			visible = true

		rect_position = -rect_size/2 + dir_dring * 120
	elif visible:
		visible = false
