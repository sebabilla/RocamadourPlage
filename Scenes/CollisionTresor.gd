extends CollisionShape2D

signal exlamation_on
signal bulle_on
signal bulle_off

var interaction: int = 0

func _ready():
	shape.radius = 200
	interaction = 0


func _on_Tresor_body_entered(_body):
	if interaction == 0:
		exlamation_on.emit()
		shape.radius = 30
		interaction += 1
	else:
		bulle_on.emit()


func _on_Tresor_body_exited(_body):
	if interaction > 0:
		bulle_off.emit()
