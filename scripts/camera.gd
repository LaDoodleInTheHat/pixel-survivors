extends CharacterBody2D

@export var speed: float = 500
@onready var animation = $AnimatedSprite2D

func _process(delta: float) -> void:
	# 1. Get input direction
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# 2. Handle movement
	velocity = direction * speed
	move_and_slide()
	
	if velocity.x > 0:
		animation.flip_h = false  # Facing right
	elif velocity.x < 0:
		animation.flip_h = true   # Facing left
	
	# 3. Handle animations
	if direction != Vector2.ZERO:
		animation.play("running")
	else:
		animation.play("idle") # Optional: Switch back to idle when stopped
