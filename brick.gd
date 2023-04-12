extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	#var collider = collision.get_collider()
	if collision:
		#queue_free()
		print(collision.get_collider())
	
