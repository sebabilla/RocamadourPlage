extends CollisionShape2D

signal exlamation_on
signal bulle_on
signal bulle_off

var interaction = 0

func _ready():
	shape.radius = 200
	interaction = 0


func _on_Tresor_body_entered(body):
	if interaction == 0:
		emit_signal("exlamation_on")
		shape.radius = 30
		interaction += 1
	else:
		emit_signal("bulle_on")


func _on_Tresor_body_exited(body):
	if interaction > 0:
		emit_signal("bulle_off")
