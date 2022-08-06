extends Sprite


func _ready():
	visible = false


func _on_Bulle_body_entered(body):
	if visible == false:
		visible = true

		if body.position.x < global_position.x:
			position.x = 60
		else:
			position.x = -60

		if body.position.y < global_position.y:
			position.y = 40
		else:
			position.y = -40
		

func _on_Bulle_body_exited(body):
	visible = false
