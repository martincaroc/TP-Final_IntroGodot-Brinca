extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	var anio_de_consola = 2001
	var vectorcito = Vector2(1,2)
	print(sumaVector(vectorcito))
	generation(anio_de_consola)
	sprite_2d.position=Vector2(100,300)

func _process(delta: float) -> void:
	sprite_2d.position+=Vector2(100*delta,0)

func generation(anio): #devuelvo un string con la generacion de consola
	if anio>=1972 and anio<=1983:
		print("Consola de Primera Gen")
	if anio>=1976 and anio<=1992:
		print("Consola de Segunda Gen")
	if anio>=1983 and anio<=1998:
		print("Consola de Tercera Gen")
	if anio>=1987 and anio<=2003:
		print("Consola de Cuarta Gen")
	if anio>1993 and anio<2006:
		print("Consola de Quinta Gen")
	if anio>1998 and anio<2012:
		print("Consola de Sexta Gen")
	if anio>2012 and anio<2020:
		print("Consola de Septima Gen")
	if anio>2020 and anio<2024:
		print("Consola de Octava Gen")

func sumaVector(Vector2):
	return Vector2.x + Vector2.y #devuelvo la suma de los componentes X e Y del Vector2
