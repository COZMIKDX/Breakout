extends Node2D

@export var brick_scene: PackedScene
@export var rows = 1
@export var columns = 1

var brick_x = 64
var brick_y = 16
var spacer = 8
var x = 0
var y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(rows):
		for j in range(columns):
			var brick = brick_scene.instantiate()
			brick.position = Vector2(x, y)
			x += brick_x + spacer
			add_child(brick)
			
		y += brick_y + spacer
		x = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
