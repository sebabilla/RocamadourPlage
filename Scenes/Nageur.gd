extends CharacterBody2D

signal fini(pos)

@export var speed: float = 250
@export var archimede: float = -20
var screen_size: Vector2


func _ready():
	screen_size = get_viewport_rect().size
	position.x = 1600
	position.y = -850


func _physics_process(_delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		if global_position.y > -1100:
			velocity.y -= 1

	velocity = velocity.normalized() * speed
	var poussee: float = archimede if position.y > -800 else 0.0
	velocity.y += poussee
	move_and_slide()
	

	if position.y > -800:
		if velocity.x != 0:
			$AnimatedSprite2D.flip_h = velocity.x > 0
			if (velocity.y > archimede and velocity.x > 0) or (velocity.y < archimede and velocity.x < 0):
				$AnimatedSprite2D.rotation = 0.4
			elif (velocity.y > archimede and velocity.x < 0) or (velocity.y < archimede and velocity.x > 0):
				$AnimatedSprite2D.rotation = -0.4
	else:
		if velocity.x != 0:
			$AnimatedSprite2D.rotation = 0
			$AnimatedSprite2D.flip_h = velocity.x > 0
	

func _on_Decompte_fini():
	fini.emit(global_position)
