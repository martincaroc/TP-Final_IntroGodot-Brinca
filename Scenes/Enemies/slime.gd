extends Area2D

var speed = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed*delta

func _on_timer_timeout():
	speed = -speed
