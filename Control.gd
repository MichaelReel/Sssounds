extends Control

var hz : float = 440
var sample_hz : float = 22050
var phase : float = 0

var playback : AudioStreamPlayback

onready var player := $AudioStreamPlayer
onready var playing := false

func _on_CheckBox_toggled(button_pressed : bool):
	print("On " + str(button_pressed))
	playback = player.get_stream_playback()
	playing = button_pressed
	if playing:
		_fill_buffer()
		player.play()
	else:
		player.stop()

func _process(delta : float):
	if playing:
		_fill_buffer()
	
func _fill_buffer():
	var increment = hz / sample_hz
	var to_fill = playback.get_frames_available()
	while to_fill > 0:
		playback.push_frame(
			Vector2(1.0,1.0) * sin(phase * (PI * 2.0))
		)
		phase = fmod((phase + increment), 1.0)
		to_fill -= 1
