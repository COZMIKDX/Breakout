extends CharacterBody2D

@export_range(0, 2000) var speed = 300.0
@export_range(0, 1) var paddle_x_factor = 1.0

signal brick_hit

# I don't need gravity for breakout but I'll keep this just in case.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#velocity.y += gravity * delta
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		# Collision! recalculate velocity as if the ball bounced off of what it collided with.
		velocity = velocity.bounce(collision.get_normal())
		
		var collider = collision.get_collider()
		
		if collider.name == "paddle":
			# Adjust the velocity based on the paddle's movement.
			velocity.x = velocity.x + (collider.velocity.x * paddle_x_factor)
			# The velocity vector is not the correct magnitude anymore
			# Make a unit vector and apply speed to it.
			velocity = velocity.normalized() * speed
		elif collider.is_in_group("bricks"): # Probably shouldn't use a node method when colliders returb as objects.
			brick_hit.emit(collider)
			
			

# Called in another scene
func start(_position, _direction):
	#rotation = _direction
	set_rotation_degrees(_direction)
	set_position(_position)
	# Set velocity to point right (0 degrees) with speed as it's length.
	# Then rotate the vector to point it in the desired direction. No manual vector calculation needed.
	velocity = Vector2(speed, 0).rotated(rotation)
