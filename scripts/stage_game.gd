extends Node

@onready var transPrimeiraFaseA:AudioStreamPlayer2D = $TransicaoPrimeiraFaseA
@onready var transPrimeiraFaseB:AudioStreamPlayer2D = $TransicaoPrimeiraFaseB

# Called when the node enters the scene tree for the first time.
func _ready():
	choseAudioFase()
	get_tree().paused = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
 
func choseAudioFase():
	if randi_range(0,1) == 0:
		transPrimeiraFaseA.play()
	else:
		transPrimeiraFaseB.play()
