extends Area2D


signal mange


func _ready():
	hide()


func _on_Requins_body_entered(body):
	show()


func _on_Requins_body_exited(body):
	hide()


func _on_Miam_body_entered(body):
	emit_signal("mange")
