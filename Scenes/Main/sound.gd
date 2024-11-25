extends Node

func _ready():
	play("LevelTheme")

func play(sound_name):
	get_node(sound_name).play()