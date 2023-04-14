# Originally I used a StaticBody2D but didn't know how to detect collision with it.
# I switched to CharacterBody2D but there was no collision detected, probably because the ball is moving but
# the brick isn't. The ball did detect the collision, so I simply had it emit a signal that main.gd will
# handle. I could return to using a StaticBody2D with the way I have things now.

# I also considered an Area2D to detect the ball's body. That way the brick can emit the signal itself.
# The next problem would be physics. The ball bounces off the brick now with no work from me since they are
# both bodies, but if I were to use only an Area2D, I think I might have to figure out bounce physics or
# or how to get the normal of the side intersected.

extends CharacterBody2D


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	#var collider = collision.get_collider()
	#if collision:
		#queue_free()
		#print(collision.get_collider())
	
