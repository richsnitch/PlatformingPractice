extends Label
var messages = ["Heya, pal! The name's Flameguy.", "Up ahead there, you'll see a lil yellow pad.",
"If you run up to it, it'll spring ya high into the air!", "Now isn't that a great tip?"]

var is_interacting = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".text = messages[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
