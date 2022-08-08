extends ItemList


signal ensemble
signal seule


var tresors = []
var total = 0


var valeur = {"croix": 1,
			"bouteille": -1,
			"tshirt": 1,
			"ordi": -2,
			"cafetiere": -2,
			"revue": -3,
			"parfum": 2,
			"sapin": 0,
			"dentor": 1,
			"medaillon": 3}


func _ready():
	fixed_icon_size = Vector2(60, 60)


func _on_ListeTresors_envoyer_tresors(liste):
	for tresor in liste:
		add_icon_item(load("res://Art/" + tresor + ".png"))
		tresors.append(tresor)
	

func _on_AmoureuseAssise_examen_des_tresors():
	fin_total_tresors()
	yield(get_tree().create_timer(4),"timeout")
	if total > 2:
		emit_signal("ensemble")
	else:
		emit_signal("seule")
	

func fin_total_tresors():
	var i = 0
	for tresor in tresors:
		var val = valeur[tresor]
		total += val
		if val > 0:
			set_item_custom_bg_color(i,Color(0,0.3*val,0,1))
		else:
			set_item_custom_bg_color(i,Color(-0.3*val,0,0,1))
		yield(get_tree().create_timer(0.3),"timeout")
		i += 1
	
