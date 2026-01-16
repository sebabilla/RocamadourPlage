extends Node2D


signal intro_finie

var dialogue: Array[Dictionary] = [
	{"femme":["coeur", "p_inter"], "homme":["coeur", "p_excla"] },
	{"femme":["coeur", "p_inter"], "homme":["coeur", "p_excla"] },
	{"femme":["calendrier", "p_inter"], "homme":["p_inter", "p_inter"] },
	{"femme":["gateau", "p_excla"], "homme":["p_excla", "p_inter"] },
	{"femme":["blanc", "blanc"], "homme":["coeur", "coeur"] },
	{"femme":["blanc", "blanc"], "homme":["perle", "p_excla"] },
	{"femme":["tresor", "une_min"], "homme":["une_min", "coeur"] },
]


func _ready():
	jouer_introduction()


func jouer_introduction():
	for d in dialogue:
		if d["femme"][0] != "blanc":
			$SonBulleF.play()
		$BulleHomme.visible = false
		$BulleFemme.visible = true
		$BulleFemme/DialogueFemme1.texture = load("res://Art/" + d["femme"][0] +".png")
		$BulleFemme/DialogueFemme2.texture = load("res://Art/" + d["femme"][1] +".png")
		await get_tree().create_timer(2).timeout
		$SonBulleH.play()
		$BulleFemme.visible = false
		$BulleHomme.visible = true
		$BulleHomme/DialogueHomme1.texture = load("res://Art/" + d["homme"][0] +".png")
		$BulleHomme/DialogueHomme2.texture = load("res://Art/" + d["homme"][1] +".png")
		await get_tree().create_timer(2).timeout
	intro_finie.emit()
