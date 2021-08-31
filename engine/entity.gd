extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var TYPE = "enemy"
var SPEED = 70

var movedir = Vector2(0,0)
var knockdir = Vector2(0,0)
var spritedir = "down"

var hitstun = 0
var health = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
func movement_loop():
	var motion
	if hitstun == 0:
		motion = movedir.normalized() * SPEED
	else:
		motion = knockdir.normalized() * SPEED * 1.5
	# This considers all collisions as walls
	move_and_slide(motion, Vector2(0,0))

func spritedir_loop():
	# math statement = case statement
	match movedir:
		dir.left:
			spritedir = "left"
		dir.right:
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"
		
func anim_switch(animation):
	# Concat string out of the animation type and the direction
	var newanim = str(animation, spritedir)
	#print(newanim)
	# $ prefix gets node
	if $anim.current_animation != newanim:
		$anim.play(newanim)
		
func damage_loop():
	if hitstun > 0:
		hitstun -= 1
		print(hitstun)
	for body in $hitbox.get_overlapping_bodies():
		# Check for hit timer and if it has damage to deal and if it can deal damage to the entity (enemies don't damage enemies)
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
			health -= body.get("DAMAGE")
			hitstun = 10
			# Transform.origin is the x and y
			knockdir = transform.origin - body.transform.origin
			print(health)
