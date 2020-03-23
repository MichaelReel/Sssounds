extends Control

var hz : float = 110
var sample_hz : float = 22050
var phase : float = 0

var playback : AudioStreamPlayback
var last_sample : Vector2 = Vector2.ONE

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

# warning-ignore:unused_argument
func _process(delta : float):
	if playing:
		_fill_buffer()
	
func _fill_buffer():
	var increment = hz / sample_hz
	var to_fill = playback.get_frames_available()
	while to_fill > 0:
		var noise : Vector2 = Vector2.ONE
		noise *= randf()
#		noise *= (randf() * sin(phase * (PI * 2.0))) / 2.0
#		noise *= sin(phase * (PI * 2.0))
		playback.push_frame(
			noise
		)
		last_sample = noise
		phase = fmod((phase + increment), 1.0)
		to_fill -= 1
