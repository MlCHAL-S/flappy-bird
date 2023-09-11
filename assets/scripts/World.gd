extends Node2D

const NUMBER_OF_WALLS = 20
var spawned_walls = []

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var player = preload("res://assets/scenes/PlayerNode.tscn").instance()
	#player.position = Vector2(100, 200)
	add_child(player)
	
	for i in range(NUMBER_OF_WALLS):
		var wall = preload("res://assets/scenes/Wallnode.tscn").instance()
		wall.position = Vector2((i+1) * 150, lerp(-400,-200,randf()))
		add_child(wall)
		spawned_walls.append(wall)


func _physics_process(delta):
	
	# deletes all the spawned objects
	for wall in spawned_walls:
		if wall.position.y < -1000:
			wall.queue_free()
