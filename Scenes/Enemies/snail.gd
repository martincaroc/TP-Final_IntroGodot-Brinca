extends CharacterBody2D

@export var speed = 50.0
var direction = 1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	#Wall collision
	if is_on_wall():
		if get_wall_normal().x < 0:
			direction = -1
			$AnimatedSprite2D.flip_h = false
		elif get_wall_normal().x > 0:
			direction = 1
			$AnimatedSprite2D.flip_h = true

	velocity.x = direction * speed

	move_and_slide()