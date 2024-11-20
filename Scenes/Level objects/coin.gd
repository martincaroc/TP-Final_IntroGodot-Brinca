extends Area2D

var flip_speed = 1 * TAU
var flip_amount = 0

func _process(delta):
	flip_amount += flip_speed * delta
	$Sprite2D.scale.x = 0.7 * sin(flip_amount)