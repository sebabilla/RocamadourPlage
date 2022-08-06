extends Area2D

signal decision(type)

var amour = 0
var gardes = []


func _on_Nageur_fini(nageur_position):
	if abs(nageur_position.x - global_position.x) > 400 or abs(nageur_position.y - global_position.y) > 400:
		emit_signal("decision", "absent")
	
	get_child(0).texture = load("res://Art/amoureuse_check.png")
	get_child(0).position.x += 200 
	yield(get_tree().create_timer(1),"timeout")
	examen_des_tresors()
	yield(get_tree().create_timer(2),"timeout")

	if amour > 2:
		emit_signal("decision", "ensemble")
	else:
		emit_signal("decision", "seule")
	
	
func examen_des_tresors():
	amour = $"../ItemListDepot".fin_total_tresors()
	gardes = $"../ItemListDepot".fin_garder_tresors()
	
