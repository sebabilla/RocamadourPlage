extends Sprite

var sens = "droite"
var vitesse = 200
var temps = 0.0
var vertical = 0.0


func _process(delta):
	
	position.y -= vertical
	temps += 0.01
	vertical = sin(temps) * 5000 * delta
	position.y += vertical
	
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
		
