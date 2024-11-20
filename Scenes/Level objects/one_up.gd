extends Area2D

var flip_amount = 0
var flip_speed = 1 * TAU

func _process(delta):
	flip_amount += flip_speed * delta
	$Sprite2D.scale.x = 0.5 * sin(flip_amount)
