extends "res://engine/entity.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var movetimer_length = 15
var movetimer = 15
var DAMAGE = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	movedir = dir.rand()
	print(TYPE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement_loop()
	if movetimer >= 0:
		movetimer -= 1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length
	#damage_loop()
