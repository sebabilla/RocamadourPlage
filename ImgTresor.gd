extends Sprite


func _ready():
	var lien = "res://Art/" + get_owner().nom_tresor + ".png"
	texture = load(lien)

