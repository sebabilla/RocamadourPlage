extends Area2D

signal absent
signal examen_des_tresors


func _on_Nageur_fini(nageur_position):
	if abs(nageur_position.x - global_position.x) > 400 or abs(nageur_position.y - global_position.y) > 400:
		absent.emit()
	
	%FemmeAssise.texture = load("res://Art/amoureuse_check.png")
	%FemmeAssise.position.x += 200 
	await get_tree().create_timer(1).timeout
	examen_des_tresors.emit()
	
	
