extends "res://engine/entity.gd"

#TYPE = "player"
# Declare member variables here.
var state = "default"
# Called when the node enters the scene tree for the first time.
func _ready():
	health = 1
	TYPE = "player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		"default":
			state_default()
		"swing":
			state_swing()

func controls_loop():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
	if is_on_wall():
		if spritedir == 'left' and test_move(transform, Vector2(-1,0)):
				anim_switch('push')
		if spritedir == 'right' and test_move(transform, Vector2(1,0)):
				anim_switch('push')
		if spritedir == 'up' and test_move(transform, Vector2(0,-1)):
				anim_switch('push')
		if spritedir == 'down' and test_move(transform, Vector2(0,1)):
				anim_switch('push')
		#if (spritedir == 'left' or spritedir == 'right' or spritedir == 'up' or spritedir == 'down') and (test_move(transform, Vector2(-1,0)) or test_move(transform, Vector2(1,0)) or test_move(transform, Vector2(0,-1)) or test_move(transform, Vector2(0,-1))):
		#		anim_switch('push')
	elif movedir != Vector2(0,0):
		anim_switch('walk')
	else:
		anim_switch('idle')


func state_default():
	controls_loop()
	movement_loop()
	spritedir_loop()
	damage_loop()
	if movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
	if Input.is_action_just_pressed('a'):
		use_item(preload("res://items/sword.tscn"))

func state_swing():
	anim_switch("idle")
	damage_loop()

# States:
# falling
# pushing
# speaking
# pulling?
