extends KinematicBody2D

const UP = Vector2(0,-1)
const FLAP = 200
const MAXFALLSPEED = 400
const MAX_ROTATION_SPEED = 20
const GRAVITY = 10
const MAX_ROTATION_DOWNWARDS = 50
const DEGREE_BY_WHICH_TO_ROTATE = 2

var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	if rotation_degrees > MAX_ROTATION_DOWNWARDS:
		rotation_degrees = MAX_ROTATION_DOWNWARDS
		
	if Input.is_action_just_pressed("FLAP"):
		motion.y = -FLAP
		rotation_degrees = -(FLAP / 5)
	else:
		rotation_degrees += DEGREE_BY_WHICH_TO_ROTATE
		

	motion = move_and_slide(motion, UP)
	
	
	# checking for collisions
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		print("Collided with: ", collision.collider.name)


