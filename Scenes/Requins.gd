extends Area2D


signal mange


func _ready():
	hide()


func _on_Requins_body_entered(_body):
	show()


func _on_Requins_body_exited(_body):
	hide()


func _on_Miam_body_entered(_body):
	mange.emit()
