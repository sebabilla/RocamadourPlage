extends Sprite2D


signal recommencer


func _ready():
	await get_tree().create_timer(0.1).timeout
	for i in range($Badges.get_child_count() - 1):
		$Badges.get_child(i + 1).texture = load("res://Art/badge_" + General.fins[i] + ".png")


func _on_Quitter_body_entered(_body):
	get_tree().quit()


func _on_Recommencer_body_entered(_body):
	recommencer.emit()
