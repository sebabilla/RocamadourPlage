extends Node2D


signal fin_finie

var amoureuse = "absent"


func _ready():
	yield(get_tree().create_timer(0.2),"timeout")
	if amoureuse == "absent":
		jouer_fin_absent()
	elif amoureuse == "seule":
		$Grognement.play()
		jouer_fin_seule()
	elif amoureuse == "ensemble":
		$Miaou.play()
		jouer_fin_ensemble()
	elif amoureuse == "amoureux":
		$Miaou.play()
		joueur_fin_amoureux()
	else:
		jouer_fin_mange()


func jouer_fin_absent():
	$NageurFin.queue_free()
	$BulleFemme.visible = true
	$BulleFemme/DialogueFemme.texture = load("res://Art/bouteille.png")
	yield(get_tree().create_timer(3),"timeout")
	$BulleFemme.queue_free()
	
	partir()
	
	
func jouer_fin_seule():
	$BulleFemme.visible = true
	$BulleFemme/DialogueFemme.texture = load("res://Art/colere.png")
	yield(get_tree().create_timer(3),"timeout")	
	$BulleFemme.queue_free()
	
	partir()

	
func jouer_fin_ensemble():
	$BulleFemme.visible = true
	$BulleFemme/DialogueFemme.texture = load("res://Art/coeur.png")	
	yield(get_tree().create_timer(3),"timeout")
	$BulleFemme.queue_free()
	$NageurFin.queue_free()
	$NageurDebout.visible = true
	
	partir()
	
	
func joueur_fin_amoureux():
	$AmoureuseFin.texture = load("res://Art/am_debout.png")
	jouer_fin_ensemble()
	
	
func jouer_fin_mange():
	$NageurFin.visible = false
	$BulleFemme.modulate.a = 0.3
	$BulleFemme/DialogueFemme.modulate.a = 0.7
	$NageurDebout.modulate.a = 0.7
	jouer_fin_ensemble()
	

func partir():	
	
	for _i in range(40):
		$AmoureuseFin.position.x += 5
		$AmoureuseFin.position.y += -5
		$NageurDebout.position.x += 5
		$NageurDebout.position.y += -5
		yield(get_tree().create_timer(0.05),"timeout")

	for _i in range(60):
		
		$AmoureuseFin.position.x += 5
		$AmoureuseFin.position.y += -1
		$AmoureuseFin.modulate.a -= 0.01
		$NageurDebout.position.x += 5
		$NageurDebout.position.y += -1
		$NageurDebout.modulate.a -= 0.01
		yield(get_tree().create_timer(0.05),"timeout")
	
	
	emit_signal("fin_finie")
