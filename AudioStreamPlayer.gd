extends AudioStreamPlayer

var menu_music = load("res://Music/howsthisforamainmenu.mp3")
var level_music = load("res://Music/jungletune.mp3")
var settings_music = load("res://Music/Uwa_So_Rich.mp3")
var level_3_music = load("res://Music/didyoufindeverythingokay.mp3")
var music


func play_menu_music():
	if music != menu_music:
		$".".stream = menu_music
		$".".play()
		music = menu_music

func play_level_music():
	$".".stream = level_music
	$".".play()
	music = level_music
	
func play_settings_music():
	$".".stream = settings_music
	$".".play()
	music = settings_music
	
func play_level3_music():
	$".".stream = level_3_music
	$".".play()
	music = level_3_music
