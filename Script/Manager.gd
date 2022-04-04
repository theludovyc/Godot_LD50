extends Node

onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play_backwards("Fade")
	pass # Replace with function body.

func change_scene(_next_scene:String):
	anim.play("Fade")
	
	yield(anim, "animation_finished")
	
	get_tree().change_scene(_next_scene)
	
	anim.play_backwards("Fade")
