extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
const EnemyExplosion = preload("res://Scenes/VFX/enemy_explosion.tscn")


var last_checkpoint_position = Vector2.ZERO

func _ready():
	last_checkpoint_position = position


func _physics_process(delta):
	# Add the gravity.
	var gravity = get_gravity() * 1.4

	if not is_on_floor():
		velocity += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		Sound.play("Jump")

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
	GameManager.lives -= 1
	GameManager.lives_changed.emit()
	Sound.play("LoseLife")

	if GameManager.lives > 0:
		position = last_checkpoint_position
	else:
		Sound.play("GameOver")
		get_tree().reload_current_scene()
		GameManager.lives = 3
		GameManager.lives_changed.emit()
		GameManager.coins = 0
		GameManager.coins_changed.emit()
	
#Player Collision with other objects
func _on_area_2d_area_entered(area):
	if area.is_in_group("enemies"):
		collide_with_enemy(area)	
	elif area.is_in_group("deathzone") or area.is_in_group("projectiles"):
		lose()
	elif area.is_in_group("coins"):
		#Handle coins grabbed
		GameManager.coins += 1
		GameManager.coins_changed.emit()
		Sound.play("Coin")
		area.queue_free()
	elif area.is_in_group("one_ups"):
		#Handle lives grabbed
		GameManager.lives += 1
		GameManager.coins_changed.emit()
		Sound.play("OneUp")
		area.queue_free()
	elif area.is_in_group("checkpoints"):
		#Handle checkpoints reached
		if not area.is_taken:
			last_checkpoint_position = area.position
			area.take()
			Sound.play("OneUp")
	elif area.is_in_group("exit_sign"):
		get_tree().change_scene_to_file("res://Scenes/Main/win_menu.tscn")
		Sound.play("OneUp")


func collide_with_enemy(enemy):
	if position.y > enemy.position.y:
		#print("perdi")
		lose()
	else:
		#print("gane")
		enemy.queue_free()
		Sound.play("EnemyKill")
		velocity.y = JUMP_VELOCITY
		var explosion = EnemyExplosion.instantiate()
		explosion.global_position = enemy.global_position + 30 * Vector2.UP
		add_child(explosion)

#Player Collision with bodies
func _on_area_2d_body_entered(body):
	if body.is_in_group("enemies"):
		collide_with_enemy(body)