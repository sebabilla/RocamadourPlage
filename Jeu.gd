extends Node2D


signal jeu_fini(amoureuse)


func _on_Requins_mange():
	emit_signal("jeu_fini", "mange")

	
func _on_Amoureux_amoureux_accepte():
	emit_signal("jeu_fini", "amoureux")


func _on_AmoureuseAssise_absent():
	emit_signal("jeu_fini", "absent")


func _on_ItemListDepot_ensemble():
	emit_signal("jeu_fini", "ensemble")


func _on_ItemListDepot_seule():
	emit_signal("jeu_fini", "seule")
