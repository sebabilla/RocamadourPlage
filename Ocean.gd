extends Sprite

func _on_Nageur_profondeur(y):
	visible = true if y < -800 else false
