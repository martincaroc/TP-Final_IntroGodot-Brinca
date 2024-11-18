extends Area2D

var speed = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed*delta

func _on_timer_timeout():
	speed = -speed
	if speed > 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
