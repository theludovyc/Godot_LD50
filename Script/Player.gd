extends KinematicBody2D

signal disable_dring

const Max_Speed = 300
const Move_Speed = Max_Speed * 0.5
const Stop_Speed = Max_Speed * 0.3
const Gravity = 30
const JUMP = Gravity * 20

var dir_x:int
var vel:Vector2

var want_jump := false

onready var sprite = $Sprite
onready var anim_tree = $AnimationTree
onready var anim_playback = anim_tree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	want_jump = Input.is_action_just_pressed("ui_select")
		
	dir_x = Input.get_axis("ui_left", "ui_right")
	
	if dir_x > 0:
		sprite.flip_h = false
	elif dir_x < 0:
		sprite.flip_h = true
	
	anim_tree["parameters/conditions/is_running"] = dir_x != 0
	anim_tree["parameters/conditions/is_not_running"] = dir_x == 0
	
	anim_tree["parameters/conditions/is_falling"] = !is_on_floor()
		
	anim_tree["parameters/conditions/is_on_floor"] = is_on_floor()

func get_speed_x() -> float:
	if dir_x != 0:
		return clamp(vel.x+dir_x*Move_Speed, -Max_Speed, Max_Speed)
	return sign(vel.x)*clamp(abs(vel.x)-Stop_Speed, 0, Max_Speed)

func _physics_process(delta: float) -> void:
	vel.x = get_speed_x()
	
	if is_on_floor():
		vel.y = Gravity
		
		if want_jump:
			vel.y -= JUMP
	else:
		vel.y += Gravity
	
	vel = move_and_slide(vel, Vector2.UP)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Dring"):
		if area.is_active:
			emit_signal("disable_dring")
	pass # Replace with function body.
