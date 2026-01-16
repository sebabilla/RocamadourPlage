extends Area2D



func _ready():
	hide()

func _on_PChirurgiens_body_entered(_body):
	show()


func _on_PChirurgiens_body_exited(_body):
	hide()
