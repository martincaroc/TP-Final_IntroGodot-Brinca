extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$LabelCoins.text = str(GameManager.coins)
	$LabelLives.text = str(GameManager.lives)
