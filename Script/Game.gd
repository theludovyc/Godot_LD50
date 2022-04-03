extends Node

const timeout = 30
const dring_time = 5

var dring:Node2D
var dring_index := 0

var on_dring := false

onready var player = $Player
onready var camera = $Player/Camera2D
onready var drings = $Drings
onready var dring_arrow = $Player/Camera2D/DringArrow
onready var timer = $Timer

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

func next_dring():
	dring = drings.get_child(dring_index)
	dring.do_active()
	
	timer.start(timeout)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Saver.dring_count = drings.get_child_count()
	
	next_dring()
	pass # Replace with function body.

func get_real_visible_rect():
	var rect = get_viewport().get_visible_rect()
	
	rect.size *= camera.zoom
	rect.position = camera.global_position - rect.size/2
	
	return rect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dring_arrow.do_update(
		player.position.direction_to(dring.position).normalized(),
		player.global_position.distance_to(dring.global_position)
	)


func _on_Player_disable_dring() -> void:
	if on_dring:
		on_dring = false
		
	dring.do_disabled()
	
	dring_index += 1
	
	Saver.dring_counter += 1
	
	if dring_index >= drings.get_child_count():
		get_tree().change_scene("res://Scene/Win.tscn")
	else:
		next_dring()


func _on_Timer_timeout() -> void:
	if on_dring:
		get_tree().change_scene("res://Scene/Win.tscn")
	else:
		dring.do_dring()
		
		on_dring = true
		
		timer.start(dring_time)
