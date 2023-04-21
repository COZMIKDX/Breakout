extends Node
var play = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$ball.start($ball.position, 45)
	$ball.modulate = Color("aliceblue")
	#$ball2.start($ball.position, 95)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if play and get_tree().get_nodes_in_group("bricks").is_empty():
		$bgm.stop()
		$stage_clear_sfx.play()
		play = false
	pass

func _on_ball_brick_hit(colliding_brick):
	colliding_brick.queue_free()
	$brick_hit.play()
	pass # Replace with function body.
