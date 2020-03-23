extends Control

onready var playback := $AudioStreamPlayer

func _on_CheckBox_toggled(button_pressed : bool):
	print("On " + str(button_pressed))
	
	
