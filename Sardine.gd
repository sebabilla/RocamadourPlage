extends Sprite

var sens = "droite"
var vitesse = 150




func _process(delta):
	if sens == "droite":
		position.x += vitesse * delta
		if position.x > 800:
			flip_h = true
			sens = "gauche"
	else:
		position.x -= vitesse * delta
		if position.x < 0:
			flip_h = false
			sens = "droite"
