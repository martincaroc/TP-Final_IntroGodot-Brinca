extends Area2D

var is_taken = false

func take():
	if not is_taken:
		$AnimatedSprite2D.play("taken")
		is_taken = true