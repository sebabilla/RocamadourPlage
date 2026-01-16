extends Sprite2D


func _ready():
	visible = false


func _process(_delta):
	rotation = atan((-830-global_position.y)/(2150-global_position.x)) #pos femme + décalage flèce par rapport joueur
	

func _on_TimerRentrer_timeout():
	visible = true


func _on_TimerRentrer2_timeout():
	texture = load("res://Art/f_rouge.png")
