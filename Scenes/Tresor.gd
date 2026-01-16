extends Node2D

@export var nom_tresor: String = "rien"


func _ready():
	var lien: String = "res://Art/" + nom_tresor + ".png"
	%ImgTresor.texture = load(lien)
	%ExclamationPoint.visible = false


func _on_PrendreTresor_body_entered(_body):
	$SonRamasse.play()
	General.tresors.append(nom_tresor)
	$Exclamation.call_deferred("queue_free")
	$Bulle.call_deferred("queue_free")

func _on_exclamation_body_entered(_body: Node2D) -> void:
	%ExclamationPoint.visible = true
