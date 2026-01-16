extends Sprite2D

func _process(_delta: float) -> void:
	visible = true if %Nageur.position.y < -800 else false
