extends Node2D


func _process(delta):
	if global_position.y > -600:
		if randi() % 600 == 0:
			if randi() % 2 == 0:
				deux_bulles()
			else:
				une_bulle()
				

func une_bulle():
	$SonUneBulle.play()
	var x = 80 if get_parent().velocity.x > 0 else 0
	$SpriteUneBulle.position.x += x
	$SpriteUneBulle.visible = true
	yield(get_tree().create_timer(0.6),"timeout")
	$SpriteUneBulle.visible = false
	$SpriteUneBulle.position.x -= x
	
	
func deux_bulles():
	$SonDeuxBulles.play()
	var x = 80 if get_parent().velocity.x > 0 else 0
	$SpriteDeuxBulles.position.x += x
	$SpriteDeuxBulles.visible = true
	yield(get_tree().create_timer(0.6),"timeout")
	$SpriteDeuxBulles.visible = false
	$SpriteDeuxBulles.position.x -= x
