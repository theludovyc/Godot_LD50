extends Area2D

var dring_sound = preload("res://Art/Sound/alarm_clock_5.mp3")

var is_active:=false

onready var petite = $Petite
onready var grande = $Grande
onready var anim_player = $AnimationPlayer
onready var audio = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func do_active():
	is_active = true
	
	audio.play()
	
func do_disabled():
	is_active = false
	
	do_idle()
	
	audio.stop()

func do_dring():
	anim_player.play("Dring")
	
	audio.stream = dring_sound
	
	audio.play()
	
func do_idle():
	anim_player.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_active:
		petite.rotate(0.1)
		grande.rotate(-0.05)
#	pass
