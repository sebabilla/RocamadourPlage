extends Sprite


signal recommencer


func _on_Quitter_body_entered(body):
	get_tree().quit()


func _on_Recommencer_body_entered(body):
	emit_signal("recommencer")
