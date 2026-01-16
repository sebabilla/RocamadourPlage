extends Area2D


func _ready():
	$CollisionPrendre.set_deferred("disabled", true) 


func _on_Bulle_body_entered(_body):
	$CollisionPrendre.set_deferred("disabled", false) 


func _on_Bulle_body_exited(_body):
	$CollisionPrendre.set_deferred("disabled", true) 
