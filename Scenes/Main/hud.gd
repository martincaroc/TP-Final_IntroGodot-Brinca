extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.coins_changed.connect(update)
	GameManager.lives_changed.connect(update)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func update():
	$LabelCoins.text = str(GameManager.coins)
	$LabelLives.text = str(GameManager.lives)