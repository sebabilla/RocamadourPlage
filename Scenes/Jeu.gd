extends Node2D


signal jeu_fini(amoureuse)


func _on_Requins_mange():
	jeu_fini.emit("mange")
	General.fins[0] = "mange"

	
func _on_Amoureux_amoureux_accepte():
	jeu_fini.emit("amoureux")
	General.fins[1] = "amoureux"


func _on_AmoureuseAssise_absent():
	jeu_fini.emit("absent")
	General.fins[2] = "absent"


func _on_ItemListDepot_ensemble():
	jeu_fini.emit("ensemble")
	General.fins[3] = "ensemble"


func _on_ItemListDepot_seule():
	jeu_fini.emit("seule")
	General.fins[4] = "seule"
