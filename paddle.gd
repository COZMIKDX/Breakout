extends CharacterBody2D


@export var SPEED = 600.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

## Godot gave me some premade code for this node type.
## I will comment out parts of it but keep them as notes. Maybe I'll stick them in obsidian later.
func _physics_process(delta):
	# Add the gravity.  ## Uses the a defined up direction and angle of floor (both CharacterBody2D properties)
	## to determine if this thing is on the floor or not.
	#if not is_on_floor():
	#	velocity.y += gravity * delta

	# Handle Jump.
	#if Input.is_action_just_pressed("") and is_on_floor():
		## Changes on y velocity so that the player can still move sideways
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	## This function lets you choose which inputs for it to consider as positive and negative.
	## Then it subtracts positive from negative. 1=left, -1=right, 0=both
	var direction = Input.get_axis("move_left", "move_right")
	## If either direction is pressed but not both.
	if direction:
		velocity.x = direction * SPEED
	else:
		## move_toward changes your input by the delta, SPEED in this case, until you reach the goal, 0 here.
		## decrease the delta to make the change slower.
		velocity.x = move_toward(velocity.x, 0, SPEED)

	#velocity.y = 0
	
	## I switched to move_and_collide because I don't need the paddle to move other than with my inputs.
	move_and_collide(velocity * delta)
	

