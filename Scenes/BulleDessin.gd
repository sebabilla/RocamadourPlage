extends Sprite2D


func _ready():
	visible = false


func _on_Bulle_body_entered(body):
	if visible == false:
		visible = true

		position.x = 60 * -1**(int(body.position.x > global_position.x))
		position.y = 40 * -1**(int(body.position.y > global_position.y))
		

func _on_Bulle_body_exited(_body):
	visible = false
