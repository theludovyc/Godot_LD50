extends Node

var dring:Node2D
var dring_index := 0

onready var player = $Player
onready var camera = $Player/Camera2D
onready var drings = $Drings
onready var hud = $HUD

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

func next_dring():
	dring = drings.get_child(dring_index)
	dring.is_active = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_dring()
	
	prints(name, "Hello, World !")
	pass # Replace with function body.

func get_real_visible_rect():
	var rect = get_viewport().get_visible_rect()
	
	rect.size *= camera.zoom
	rect.position = camera.global_position - rect.size/2
	
	return rect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hud.update_dring_arrow(player.position.distance_to(dring.position), player.position.direction_to(dring.position).normalized())
	
#	pass


func _on_Player_disable_dring() -> void:
	dring_index += 1
	
	if dring_index >= drings.get_child_count():
		prints(name, "win o/")
		pass
	else:
		next_dring()
