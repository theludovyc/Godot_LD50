extends Area2D

var is_active:=false

onready var petite = $Petite
onready var grande = $Grande
onready var anim_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func do_dring():
	anim_player.play("Dring")
	
func do_idle():
	anim_player.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_active:
		petite.rotate(0.1)
		grande.rotate(-0.05)
#	pass
