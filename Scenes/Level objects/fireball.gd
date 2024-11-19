extends Area2D

var speed = -200
var rotation_speed = 2 * TAU #TAU == (2*PI)

func _process(delta):
	position.y += speed * delta
	$Sprite2D.rotate(rotation_speed * delta)


func _on_timer_timeout():
	queue_free()