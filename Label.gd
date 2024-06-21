extends Label
var rng = RandomNumberGenerator.new()
var messages = ['Bean Can Binary is so goated','Skol to the Bowl','Super Scrup coming soon','Poverty Paradise game of the year',
'UWA! SO RICH!']

# Called when the node enters the scene tree for the first time.
func _ready():
	var rand = rng.randi_range(0,4)
	$".".text = messages[rand]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
