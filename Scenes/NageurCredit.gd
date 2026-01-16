extends CharacterBody2D


@export var speed: float = 400
@export var archimede: float = -20


func _physics_process(_delta):
	
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		if position.y < 1200:
			velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		if position.y > 400:
			velocity.y -= 1

	velocity = velocity.normalized() * speed
	velocity.y += archimede
	move_and_slide()
	
