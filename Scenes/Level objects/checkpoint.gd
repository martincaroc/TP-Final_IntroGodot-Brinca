extends Area2D

var is_taken = false

func take():
	$AnimatedSprite2D.play("taken")
	is_taken = true