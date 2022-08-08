extends Node2D

signal amoureux_accepte

export var nom_tresor = "coeur"


func _ready():
	pass


func _on_PrendreTresor_body_entered(body):
	$SonBulle.play()
	remove_child($Exclamation)
	yield(get_tree().create_timer(0.5),"timeout")
	remove_child($Bulle)
	emit_signal("amoureux_accepte")
	
