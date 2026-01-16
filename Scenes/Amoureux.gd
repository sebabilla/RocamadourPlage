extends Node2D

signal amoureux_accepte

@export var nom_tresor: String = "coeur"


func _on_PrendreTresor_body_entered(_body):
	$SonBulle.play()
	call_deferred("remove_child", $Exclamation)
	await get_tree().create_timer(0.5).timeout
	call_deferred("remove_child", $Bulle)
	amoureux_accepte.emit()
	

func _on_exclamation_body_entered(_body: Node2D) -> void:
	%ExclamationPoint.visible = true
