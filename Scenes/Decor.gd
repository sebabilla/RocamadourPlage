extends Sprite2D


func _ready() -> void:
	$MIntro.play()
	var intro: Node2D = load("res://Scenes/Introduction.tscn").instantiate()
	$EnCours.add_child(intro)
	intro.intro_finie.connect(_on_Introduction_intro_finie)
	

func _on_Introduction_intro_finie() -> void:
	var jeu: Node2D = load("uid://cqaia0o7b3sw8").instantiate()
	fondu_on()
	nettoyer_en_cours()
	$MIntro.stop()
	$MJeu.play()
	fondu_off()
	
	$EnCours.add_child(jeu)
	jeu.jeu_fini.connect(_on_Jeu_jeu_fini)
	

func _on_Fin_recommencer() -> void:
	var jeu: Node2D = load("uid://cqaia0o7b3sw8").instantiate()
	fondu_on()
	nettoyer_en_cours()
	$MFin.stop()
	$MJeu.play()
	fondu_off()
	$EnCours.call_deferred("add_child", jeu)
	jeu.jeu_fini.connect(_on_Jeu_jeu_fini)


func _on_Jeu_jeu_fini(amoureuse) -> void:
	var fin: Node2D = load("res://Scenes/Fin.tscn").instantiate()
	fin.amoureuse = amoureuse
	fin.fin_finie.connect(_on_Fin_fin_finie)
	match amoureuse:
		"mange":
			$MMange.play()
			$Fondu.texture = load("res://Art/sang.png")
		"amoureux":
			$Fondu.texture = load("res://Art/rose.png")
		_:
			$Fondu.texture = load("res://Art/noir.png")
			
	fondu_on()
	nettoyer_en_cours()
	$MJeu.stop()
	$MFin.play()
	fondu_off()
	$EnCours.add_child(fin)
	

func _on_Fin_fin_finie() -> void:
	var credits: Node2D = load("res://Scenes/Credits.tscn").instantiate()
	credits.recommencer.connect(_on_Fin_recommencer)
	$Fondu.texture = load("res://Art/noir.png")
	fondu_on()
	nettoyer_en_cours()
	fondu_off()
	$EnCours.add_child(credits)

func fondu_on() -> void:
	$Fondu.show()
	await get_tree().create_timer(0.3).timeout
	
	
func fondu_off() -> void:
	await get_tree().create_timer(0.3).timeout
	$Fondu.hide()

func nettoyer_en_cours() -> void:
	$EnCours.get_child(0).queue_free()
