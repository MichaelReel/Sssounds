extends Control

onready var player := $AudioStreamPlayer
onready var playing := false

func _on_CheckBox_toggled(button_pressed : bool):
	print("On " + str(button_pressed))
	playing = button_pressed
	if playing:
		player.play()
	else:
		player.stop()
