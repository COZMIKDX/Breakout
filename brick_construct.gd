# A node for creating a grid of blocks without having to copy and paste a ton of brick nodes.
@tool
extends Node2D

var modified = false
@export var brick_scene: PackedScene
@export var rows = 1:
	set(new_value):
		rows = new_value
		modified = true
		
@export var columns = 1:
	set(new_value):
		columns = new_value
		modified = true

const brick_x = 64
const brick_y = 16
const spacer = 8


# Called when the node enters the scene tree for the first time.
func _ready():
	# Place a the bricks in a row and then move to the next row.
	#create_construct()
	print("ready!")
	pass

func create_construct():
	var x = 0
	var y = 0
	print("Construct")
	for i in range(rows):
		for j in range(columns):
			var brick = brick_scene.instantiate()
			brick.position = Vector2(x, y)
			x += brick_x + spacer
			add_child(brick)
			
		y += brick_y + spacer
		x = 0

func remove_children():
	for n in get_children():
		remove_child(n)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# I do this here because I want this part to run in tool mode too.
	# Note: It seems to run only in scenes it is instanced in. 
	if modified:
		remove_children()
		create_construct()		
		modified = false
		print("construct done")
	pass
