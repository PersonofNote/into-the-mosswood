extends "res://engine/entity.gd"

#TYPE = "player"
# Declare member variables here.
var DAMAGE = 1
var HEALTH = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	TYPE = "player"
	print(TYPE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop()
	damage_loop()
	if movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
		
#func physics_process(_delta):
#	controls_loop()
#	movement_loop()


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


