extends Node

# You should and can use 'users' instead of res
const SAVE_PATH = "res://savegame.bin" 

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"playerHP": Game.playerHP,
		"Gold": Game.gold
	}
	var jstr = JSON.stringify(data) # turn our dictionary into a string
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached(): # if end of file not reached
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.playerHP = current_line["playerHP"]
				Game.gold = current_line["Gold"]
