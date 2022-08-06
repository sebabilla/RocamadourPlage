extends KinematicBody2D


export var speed = 400
export var archimede = -20
var velocity = Vector2()


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
	var mouvement = velocity
	move_and_slide(mouvement, Vector2(0, -1))
	
	$AnimatedSprite.play()


func _on_Quitter_body_entered(body):
	get_tree().quit()


func _on_Recommencer_body_entered(body):
	print(2)
