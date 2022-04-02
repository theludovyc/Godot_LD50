extends Area2D

var is_active:=false

onready var petite = $Petite
onready var grande = $Grande

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_active:
		petite.rotate(0.1)
		grande.rotate(-0.05)
#	pass
