extends ItemList

var tresors = []

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
	

func fin_total_tresors():
	var total = 0
	for tresor in tresors:
		total += valeur[tresor]
	return total
	

func fin_garder_tresors():
	clear()
	var temp = []
	for tresor in tresors:
		yield(get_tree().create_timer(0.2),"timeout")
		if valeur[tresor] > 0:
			temp.append(tresor)
			$SonGardes.play()
		else:
			add_icon_item(load("res://Art/" + tresor + ".png"))
			$SonLaisse.play()
	return temp
			
