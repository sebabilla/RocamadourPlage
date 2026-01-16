extends Control

signal fini

func _ready():
	$Sonnette.play()
	%TimerDecompte.wait_time = max(0.1, %ProgressBarDecompte.value)

func _process(_delta):
	%ProgressBarDecompte.value = %TimerDecompte.time_left


func _on_TimerDecompte_timeout():
	$Sonnette.play()
	fini.emit()
	hide()
