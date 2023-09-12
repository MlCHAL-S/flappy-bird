extends Node2D

const NUMBER_OF_WALLS = 20
const SPACE_BETWEEN_WALLS = 200

var first_wall_x_pos = 500
var spawned_walls = []

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# change scene -> get_tree().current_scene.changeSceneWithFilePath("")
	var player = load("res://assets/scenes/Player.tscn").instance()
	player.position = Vector2(100, 200)
	add_child(player)
	
	
	# makes the game wait
	yield(get_tree().create_timer(1), "timeout")
	
	for i in range(NUMBER_OF_WALLS):
		var wall = load("res://assets/scenes/Wall.tscn").instance()
		wall.position = Vector2(first_wall_x_pos , lerp(-100,100,randf()))
		add_child(wall)
		spawned_walls.append(wall)
		first_wall_x_pos += SPACE_BETWEEN_WALLS


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
