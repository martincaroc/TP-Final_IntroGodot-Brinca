extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$LabelScore.text = "You collected "+str(GameManager.coins)+" coins"


func _on_exit_pressed():
	GameManager.resetGame()
	get_tree().change_scene_to_file("res://Scenes/Main/main_menu.tscn")

func _on_play_again_pressed():
	GameManager.resetGame()
	get_tree().change_scene_to_file("res://Scenes/Main/level.tscn")
