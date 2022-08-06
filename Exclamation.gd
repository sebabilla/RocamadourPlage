extends Sprite


func _ready():
	visible = false


func _on_Exclamation_body_entered(body):
	visible = true
