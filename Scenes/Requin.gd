extends Sprite2D

var droite: bool = true
var vitesse: float = 200
var temps: float = 0.0
var vertical: float = 0.0


func _process(delta):
	position.y -= vertical
	temps += 0.01
	vertical = sin(temps) * 5000 * delta
	position.y += vertical
	
	if droite:
		position.x += vitesse * delta
		if position.x > 800:
			flip_h = true
			droite = false
	else:
		position.x -= vitesse * delta
		if position.x < 0:
			flip_h = false
			droite = true
		
