extends Sprite


var fins = ["vide", "vide", "vide", "vide", "vide"]


func _ready():
	$MIntro.play()
	add_child(preload("res://Introduction.tscn").instance())
	$Introduction.connect("intro_finie", self, "_on_Introduction_intro_finie")
	randomize()
	

func _on_Introduction_intro_finie():
	fondu_on()
	$Introduction.queue_free()
	$MIntro.stop()
	$MJeu.play()
	fondu_off()
	add_child(preload("res://Jeu.tscn").instance())
	
	$Jeu.connect("jeu_fini", self, "_on_Jeu_jeu_fini")
	

func _on_Fin_recommencer():
	fondu_on()
	$Credits.queue_free()
	$MFin.stop()
	$MJeu.play()
	fondu_off()
	add_child(preload("res://Jeu.tscn").instance())
	$Jeu.connect("jeu_fini", self, "_on_Jeu_jeu_fini")


func _on_Jeu_jeu_fini(amoureuse):
	if amoureuse == "mange":
		fins[0] = "mange"
		$MMange.play()
		$Fondu.texture = load("res://Art/sang.png")
	elif amoureuse == "amoureux":
		fins[1] = "amoureux"
		$Fondu.texture = load("res://Art/rose.png")
	elif amoureuse == "absent":
		fins[2] = "absent"
	elif amoureuse == "ensemble":
		fins[3] = "ensemble"
	elif amoureuse == "seule":
		fins[4] = "seule"
	fondu_on()
	$Jeu.queue_free()
	$MJeu.stop()
	$MFin.play()
	fondu_off()
	add_child(preload("res://Fin.tscn").instance())
	$Fin.amoureuse = amoureuse
	$Fin.connect("fin_finie", self, "_on_Fin_fin_finie")
	
	
func _on_Fin_fin_finie():
	$Fondu.texture = load("res://Art/noir.png")
	fondu_on()
	$Fin.queue_free()
	fondu_off()
	add_child(preload("res://Credits.tscn").instance())
	$Credits.connect("recommencer", self, "_on_Fin_recommencer")
	$Credits.fins = fins

func fondu_on():
	$Fondu.visible = true
	yield(get_tree().create_timer(0.3),"timeout")
	
	
func fondu_off():
	yield(get_tree().create_timer(0.3),"timeout")
	$Fondu.visible = false
