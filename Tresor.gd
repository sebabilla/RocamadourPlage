extends Node2D

signal tresor_pris(nom)

export var nom_tresor = "rien"


func _ready():
	pass


func _on_PrendreTresor_body_entered(body):
	$SonBulle.play()
	emit_signal("tresor_pris", nom_tresor)
	remove_child($Exclamation)
	remove_child($Bulle)
