# This is a test scene for creating a group of bricks by specifying the number of rows and columns
# It's kind of hard to use right now since you currently can't see the bricks or amount of space 
# used when creating the group.
@tool
extends Node2D


@export var brick_scene: PackedScene
@export var rows = 1:
	set(new_value):
		rows = new_value
		remove_children()
		create_construct()
		
@export var columns = 1:
	set(new_value):
		columns = new_value
		remove_children()
		create_construct()
		

var done = false
const brick_x = 64
const brick_y = 16
const spacer = 8


# Called when the node enters the scene tree for the first time.
func _ready():
	# Place a the bricks in a row and then move to the next row.
	#create_construct()
	pass

func create_construct():
	var x = 0
	var y = 0
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
	if !done:
		create_construct()		
		done = true
	pass
