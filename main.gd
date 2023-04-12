extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$ball.start($ball.position, 45)
	#$ball2.start($ball.position, 95)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_ball_brick_hit(colliding_brick):
	colliding_brick.queue_free()
	pass # Replace with function body.
