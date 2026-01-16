extends Sprite2D

var droite: bool = true
var vitesse: float = 100


func _process(delta):
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
		
