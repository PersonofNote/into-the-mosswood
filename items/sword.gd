extends Node2D

var TYPE = null
const DAMAGE = 1

var max_amount = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	TYPE = get_parent().TYPE
	$anim.connect("animation_finished", self, "destroy")
	var anim = str("sword_", get_parent().spritedir)
	$anim.play(anim)
	if get_parent().has_method("state_swing"):
		get_parent().state = "swing"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func destroy(animation):
	if get_parent().has_method("state_swing"):
		get_parent().state = "default"
	queue_free()
