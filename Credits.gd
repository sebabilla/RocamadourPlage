extends Sprite


signal recommencer


var fins = ["vide", "vide", "vide", "vide", "vide"]


func _ready():
	yield(get_tree().create_timer(0.1),"timeout")
	$Badges/Badge0.texture = load("res://Art/badge_" + fins[0] + ".png")
	$Badges/Badge1.texture = load("res://Art/badge_" + fins[1] + ".png")
	$Badges/Badge2.texture = load("res://Art/badge_" + fins[2] + ".png")
	$Badges/Badge3.texture = load("res://Art/badge_" + fins[3] + ".png")
	$Badges/Badge4.texture = load("res://Art/badge_" + fins[4] + ".png")


func _on_Quitter_body_entered(_body):
	get_tree().quit()


func _on_Recommencer_body_entered(_body):
	emit_signal("recommencer")
