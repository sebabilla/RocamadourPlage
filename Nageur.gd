extends KinematicBody2D

signal profondeur(y)
signal fini(pos)

export var speed = 250
export var archimede = -20
var velocity = Vector2()
var screen_size


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
	var poussee = archimede if position.y > -800 else 0
	velocity.y += poussee
	var mouvement = velocity
	move_and_slide(mouvement, Vector2(0, -1))
	
	$AnimatedSprite.play()
	if position.y > -800:
		if velocity.x != 0:
			$AnimatedSprite.flip_h = velocity.x > 0
			if (velocity.y > archimede and velocity.x > 0) or (velocity.y < archimede and velocity.x < 0):
				$AnimatedSprite.rotation = 0.3
			elif (velocity.y > archimede and velocity.x < 0) or (velocity.y < archimede and velocity.x > 0):
				$AnimatedSprite.rotation = -0.3
	else:
		if velocity.x != 0:
			$AnimatedSprite.rotation = 0
			$AnimatedSprite.flip_h = velocity.x > 0
	
	emit_signal("profondeur", position.y)


func _on_Decompte_fini():
	emit_signal("fini", global_position)
