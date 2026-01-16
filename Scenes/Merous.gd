extends Area2D


func _ready():
	hide()


func _on_Merous_body_entered(_body):
	show()


func _on_Merous_body_exited(_body):
	hide()
