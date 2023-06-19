extends Node

@onready var transPrimeiraFase:AudioStreamPlayer2D = $TransicaoPrimeiraFaseA

# Called when the node enters the scene tree for the first time.
func _ready():
	transPrimeiraFase.play()
	get_tree().paused = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
