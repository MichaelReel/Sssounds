extends AudioStreamPlayer

var hz : float = 220
var sample_hz : float = 44100
var phase : float = 0

var playback : AudioStreamPlayback

# warning-ignore:unused_argument
func _process(delta : float):
	_fill_buffer()
	
func _fill_buffer():
	playback = get_stream_playback()
	var increment = hz / sample_hz
	var to_fill = playback.get_frames_available()
	while to_fill > 0:
		var noise : Vector2 = Vector2.ONE
		
		# White Noise
		noise *= randf()
		
		# Tone
#		noise *= (sin(phase * (PI * 2.0))) / 2.0
#		noise *= sin(phase * (PI * 2.0))
		
		playback.push_frame(
			noise
		)
		
		phase = fmod((phase + increment), 1.0)
		to_fill -= 1
