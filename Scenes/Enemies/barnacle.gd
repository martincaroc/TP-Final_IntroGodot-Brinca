extends Area2D

var FireBallScene = preload("res://Scenes/Level objects/fireball.tscn")

func _on_timer_timeout():
	var fireball = FireBallScene.instantiate()
	#using position and not global position
	#because I like the fireball behaviour
	fireball.position = $ShootPosition.position 
	$AnimatedSprite2D.play("attack")
	add_child(fireball)