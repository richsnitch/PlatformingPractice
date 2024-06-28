extends AudioStreamPlayer

var menu_music = load("res://Music/howsthisforamainmenu.mp3")
var level_music = load("res://Music/jungletune.mp3")
var settings_music = load("res://Music/Uwa_So_Rich.mp3")
var level_3_music = load("res://Music/didyoufindeverythingokay.mp3")
var music

# Casting the MusicController node as an AudioStreamPlayer
@onready var audio_stream_player = $"." as AudioStreamPlayer


func play_menu_music():
	# Prevents the main menu music from being started over when 
	# switching between the level select and main menu screens.
	# Essentially, the music player will only start playing the menu
	# music if it is not playing already.
	if music != menu_music:
		audio_stream_player.stream = menu_music
		audio_stream_player.play()
		music = menu_music

func play_level_music():
	audio_stream_player.stream = level_music
	audio_stream_player.play()
	music = level_music
	
func play_settings_music():
	audio_stream_player.stream = settings_music
	audio_stream_player.play()
	music = settings_music
	
func play_level3_music():
	audio_stream_player.stream = level_3_music
	audio_stream_player.play()
	music = level_3_music
