extends Area2D

signal absent
signal examen_des_tresors


func _on_Nageur_fini(nageur_position):
	if abs(nageur_position.x - global_position.x) > 400 or abs(nageur_position.y - global_position.y) > 400:
		emit_signal("absent")
	
	get_child(0).texture = load("res://Art/amoureuse_check.png")
	get_child(0).position.x += 200 
	yield(get_tree().create_timer(1),"timeout")
	emit_signal("examen_des_tresors")
	
	
