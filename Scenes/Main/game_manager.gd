extends Node

signal coins_changed()
signal lives_changed()

var lives = 3
var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	resetGame()

func resetGame():
	lives = 3
	coins = 0