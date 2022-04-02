extends CanvasLayer

onready var game = get_parent()
onready var dring_arrow = $DringArrow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func update_dring_arrow(camera_to_player:Vector2, dir_dring:Vector2, dring_distance:float):
#	if dring_distance > 120:
#		if !dring_arrow.visible:
#			dring_arrow.visible = true
#
#		dring_arrow.rect_position = get_viewport().size/2 - dring_arrow.rect_size/2 + dir_dring * 120
#	elif dring_arrow.visible:
#		dring_arrow.visible = false
	
	prints(name, camera_to_player)
	
	dring_arrow.rect_position = get_viewport().size/2 + camera_to_player
