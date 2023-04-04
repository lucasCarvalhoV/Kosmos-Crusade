extends "res://scripts/inimigo.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gravidade = 18	
	super._process(delta)
	pass
