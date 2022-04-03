extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "Vous avez desactive " + str(Saver.dring_counter) + " reveils sur " + str(Saver.dring_count) + " !"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Button_pressed() -> void:
	Saver.dring_counter = 0
	
	get_tree().change_scene("res://Scene/Game.tscn")
