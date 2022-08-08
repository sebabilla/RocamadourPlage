extends Node2D

signal envoyer_tresors(liste)

var tresors = []


func _on_AmoureuseAssise_body_entered(_body):
	if len(tresors) > 0:
		emit_signal("envoyer_tresors", tresors)
		tresors = []
		
		
func _on_Nageur_fini():
	tresors = []


func _on_Croix_tresor_pris(nom):
	tresors.append(nom)

func _on_Bouteille_tresor_pris(nom):
	tresors.append(nom)

func _on_TShirt_tresor_pris(nom):
	tresors.append(nom)

func _on_Ordi_tresor_pris(nom):
	tresors.append(nom)

func _on_Cafetiere_tresor_pris(nom):
	tresors.append(nom)

func _on_Revue_tresor_pris(nom):
	tresors.append(nom)

func _on_Parfum_tresor_pris(nom):
	tresors.append(nom)

func _on_Sapin_tresor_pris(nom):
	tresors.append(nom)

func _on_DentOr_tresor_pris(nom):
	tresors.append(nom)

func _on_Medaillon_tresor_pris(nom):
	tresors.append(nom)

