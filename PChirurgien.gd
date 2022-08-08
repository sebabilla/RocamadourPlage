extends Sprite

var sens = "droite"
var vitesse = 100


func _process(delta):
	if sens == "droite":
		position.x += 5* vitesse * delta
		if position.x > 300:
			flip_h = true
			sens = "gauche"
	else:
		position.x -= vitesse * delta
		if position.x < 0:
			flip_h = false
			sens = "droite"
		
