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
	print(get_parent().spritedir)
	var anim = str("sword_", get_parent().spritedir)
	print(str("sword_", get_parent().spritedir))
	$anim.play(anim)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func destroy(animation):
	queue_free()
