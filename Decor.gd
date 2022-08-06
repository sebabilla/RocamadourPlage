extends Sprite


func _ready():
	$MIntro.play()
	add_child(load("res://Introduction.tscn").instance())
	$Introduction.connect("intro_finie", self, "_on_Introduction_intro_finie")
	

func _on_Introduction_intro_finie():
	$MIntro.stop()
	$MJeu.play()
	add_child(load("res://Jeu.tscn").instance())
	$Introduction.queue_free()
	$Jeu.connect("jeu_fini", self, "_on_Jeu_jeu_fini")
	

func _on_Fin_recommencer():
	$MFin.stop()
	$MJeu.play()
	add_child(load("res://Jeu.tscn").instance())
	$Credits.queue_free()
	$Jeu.connect("jeu_fini", self, "_on_Jeu_jeu_fini")


func _on_Jeu_jeu_fini(amoureuse):
	$MJeu.stop()
	$MFin.play()
	add_child(load("res://Fin.tscn").instance())
	$Jeu.queue_free()
	$Fin.amoureuse = amoureuse
	$Fin.connect("fin_finie", self, "_on_Fin_fin_finie")
	
	
func _on_Fin_fin_finie():
	add_child(load("res://Credits.tscn").instance())
	$Fin.queue_free()
	$Credits.connect("recommencer", self, "_on_Fin_recommencer")
