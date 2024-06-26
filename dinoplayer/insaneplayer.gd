extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -1100.0
const gravity = 3000


func _physics_process(delta):
	if GHUD.is_playing == true:
		if is_on_floor():
			if Input.is_action_pressed("ui_down"):
				$AnimatedSprite2D.play("dash")
				$CollisionShape2D.disabled = false
			else:
				$CollisionShape2D.disabled = true
				$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("jump")
			velocity.y += (gravity * delta)
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			$AudioStreamPlayer2D.play()
			velocity.y = JUMP_VELOCITY
		velocity.x = SPEED + GHUD.Score
		$Runcolisionshape2d.disabled = !$CollisionShape2D.disabled
		move_and_slide()
	else:
		$AnimatedSprite2D.stop()
