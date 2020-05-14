extends Control



onready var player := $AudioStreamPlayer
onready var playing := false
onready var noiseBusIndex : int = AudioServer.get_bus_index("Noise Bus")
onready var filterIndex : int = 0
onready var lowPass : AudioEffectLowPassFilter = AudioServer.get_bus_effect(noiseBusIndex, filterIndex)

func _on_CheckBox_toggled(button_pressed : bool):
	print("On " + str(button_pressed))
	playing = button_pressed
	if playing:
		player.play()
	else:
		player.stop()

func _on_ClipSelect_value_changed(value : float):
	lowPass.cutoff_hz = value

func _on_Volume_value_changed(value : float):
	AudioServer.set_bus_volume_db(noiseBusIndex, value)
