extends CharacterBody2D

signal fini(pos)

@export var speed: float = 250
@export var archimede: float = -20
var screen_size: Vector2
var choix_input: Node


func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(1600, -850)
	test_mobile()


func _physics_process(_delta):
	velocity = choix_input.direction
	if global_position.y < -1100:
		velocity.y += 1
	velocity *= speed
	
	var poussee: float = archimede if position.y > -800 else 0.0
	velocity.y += poussee
	
	move_and_slide()
	
	if position.y > -800:
		if velocity.x != 0:
			$AnimatedSprite2D.flip_h = velocity.x > 0
			if (velocity.y > archimede and velocity.x > 0) or (velocity.y < archimede and velocity.x < 0):
				$AnimatedSprite2D.rotation = 0.4
			elif (velocity.y > archimede and velocity.x < 0) or (velocity.y < archimede and velocity.x > 0):
				$AnimatedSprite2D.rotation = -0.4
	else:
		if velocity.x != 0:
			$AnimatedSprite2D.rotation = 0
			$AnimatedSprite2D.flip_h = velocity.x > 0

func test_mobile() -> void:
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		%InputPC.process_mode = Node.PROCESS_MODE_DISABLED
		%InputSmartphone.show()
		choix_input = %InputSmartphone
	else:
		%InputPC.process_mode = Node.PROCESS_MODE_INHERIT
		%InputSmartphone.hide()
		choix_input = %InputPC

func _on_Decompte_fini():
	fini.emit(global_position)
