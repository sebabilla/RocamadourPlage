extends Node2D


signal jeu_fini(amoureuse)


func _on_AmoureuseAssise_decision(amoureuse):
	emit_signal("jeu_fini", amoureuse)
