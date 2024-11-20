extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var coins = 0
var lives = 3

func _physics_process(delta):
	# Add the gravity.
	var gravity = get_gravity() * 1.4

	if not is_on_floor():
		velocity += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Sprite direction
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	elif direction > 0:
		$AnimatedSprite2D.flip_h = false

	# Sprite decision
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
	elif direction != 0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")

#Lose
func lose():
	get_tree().reload_current_scene()

#Player Collision with enemies
func _on_area_2d_area_entered(area):
	if area.is_in_group("enemies"):
		collide_with_enemy(area)	
	elif area.is_in_group("deathzone") or area.is_in_group("projectiles"):
		lose()
	elif area.is_in_group("coins"):
		coins += 1
		area.queue_free()
	elif area.is_in_group("one_ups"):
		lives += 1
		area.queue_free()

#Enemy Collision
#WIP Fix Player collition with enemies, can tackle enemies
#AND kill 'em, correct behaviour if I touch an enemy horizontal
#He can kill me
func collide_with_enemy(enemy):
	if position.y > enemy.position.y:
		#print("perdi")
		lose()
	else:
		#print("gane")
		enemy.queue_free()
		velocity.y = JUMP_VELOCITY

#Player Collision with bodies
func _on_area_2d_body_entered(body):
	if body.is_in_group("enemies"):
		collide_with_enemy(body)