extends Node2D


signal fin_finie

var amoureuse: String = "absent"


func _ready():
	await get_tree().create_timer(0.2).timeout
	match amoureuse:
		"absent":
			jouer_fin_absent()
		"seule":
			$Grognement.play()
			jouer_fin_seule()
		"ensemble":
			$Miaou.play()
			jouer_fin_ensemble()
		"amoureux":
			$Miaou.play()
			joueur_fin_amoureux()
		"mange":
			jouer_fin_mange()


func jouer_fin_absent():
	$NageurFin.queue_free()
	$BulleFemme.visible = true
	$BulleFemme/DialogueFemme.texture = load("res://Art/bouteille.png")
	await get_tree().create_timer(3).timeout
	$BulleFemme.queue_free()
	
	partir()
	
	
func jouer_fin_seule():
	$BulleFemme.visible = true
	$BulleFemme/DialogueFemme.texture = load("res://Art/colere.png")
	await get_tree().create_timer(3).timeout	
	$BulleFemme.queue_free()
	
	partir()

	
func jouer_fin_ensemble():
	$BulleFemme.visible = true
	$BulleFemme/DialogueFemme.texture = load("res://Art/coeur.png")	
	await get_tree().create_timer(3).timeout
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
	var a_pos_int: Vector2 = $AmoureuseFin.position + Vector2(200, -200)
	var n_pos_int: Vector2 = $NageurDebout.position + Vector2(200, -200)
	var tween: Tween = create_tween()
	tween.tween_property($AmoureuseFin, "position", a_pos_int, 2)
	tween.parallel().tween_property($NageurDebout, "position", n_pos_int, 2)
	await tween.finished
	
	var a_pos_fin: Vector2 = $AmoureuseFin.position + Vector2(300, -60)
	var n_pos_fin: Vector2 = $NageurDebout.position + Vector2(300, -60)
	var m_fin: float = 0
	var tween2: Tween = create_tween()
	tween2.tween_property($AmoureuseFin, "position", a_pos_fin, 3)
	tween2.parallel().tween_property($NageurDebout, "position", n_pos_fin, 3)
	tween2.parallel().tween_property($AmoureuseFin, "modulate:a", m_fin, 3)
	tween2.parallel().tween_property($NageurDebout, "modulate:a", m_fin, 3)
	await tween2.finished
	
	fin_finie.emit()
