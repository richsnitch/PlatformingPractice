class_name HotKeyRebindButton

extends Control

@onready var label = $HBoxContainer/Label as Label
@onready var button = $HBoxContainer/Button as Button


@export var action_name : String = "move_left"

func _ready():
	# Ignores if pressing a key is connected to another keybind.
	# Useful when we are setting a keybind so that all other potential
	# inputs are being ignored.
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()
	

func set_action_name() -> void:

	label.text = "Unassigned"
	
	# Essentially is a switch statement
	match action_name:
		"move_left":
			label.text = "Move Left"
		"move_right":
			label.text = "Move Right"
		"jump":
			label.text = "Jump"
		"climb_up":
			label.text = "Climb/Move up"
		"climb_down":
			label.text = "Climb/Move down"
		"sprint":
			label.text = "Sprint"
		"interact":
			label.text = "Interact"

func set_text_for_key() -> void:
	# Gets every event available for this specific action
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	button.text = "%s" % action_keycode
	
		


func _on_button_toggled(button_pressed):
	if button_pressed:
		button.text = "Press any key..."
		set_process_unhandled_key_input(button_pressed)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
	else:
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
				
		set_text_for_key()

func _unhandled_key_input(event):
	rebind_action_key(event)
	button.button_pressed = false
	
func rebind_action_key(event) -> void:
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	set_process_unhandled_key_input(false)
	set_text_for_key()
	set_action_name()


	
