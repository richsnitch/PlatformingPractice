extends Node2D

var music
var menu_music = load("res://Music/howsthisforamainmenu.mp3")
var level_music = load("res://Music/jungletune.mp3")
var settings_music = load("res://Music/Uwa_So_Rich.mp3")
var level_3_music = load("res://Music/didyoufindeverythingokay.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_music():
	$Music.stream = menu_music
	$Music.play()
	music = menu_music

func play_level_music():
	$Music.stream = level_music
	$Music.play()
	music = level_music
	
func play_settings_music():
	$Music.stream = settings_music
	$Music.play()
	music = settings_music
	
func play_level3_music():
	$Music.stream = level_3_music
	$Music.play()
