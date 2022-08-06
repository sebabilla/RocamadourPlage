extends Control

signal fini


onready var timer = get_node("TimerDecompte")
onready var pb = get_node("ProgressBarDecompte")

func _ready():
	$Sonnette.play()
	timer.wait_time = pb.value

func _process(delta):
	#print(timer.time_left)
	pb.value = timer.time_left


func _on_TimerDecompte_timeout():
	$Sonnette.play()
	emit_signal("fini")
	hide()
