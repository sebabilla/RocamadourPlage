extends Sprite


func _ready():
	visible = false


func _on_TimerRentrer_timeout():
	visible = true


func _on_TimerRentrer2_timeout():
	texture = load("res://Art/f_rouge.png")
