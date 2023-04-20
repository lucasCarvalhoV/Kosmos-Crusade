extends "res://scripts/inimigo.gd"

var time = randf_range(0.5,1.5)
var time_espera = 2.5
# Called when the node enters the scene tree for the first time.
func _ready():
	$giro.play("giro")
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gravidade = 500	
	time -= delta
	if(time <= 0):
		speed.y = 0
		gravidade = 0
		time_espera -= delta
		if(time_espera <= 0):
			time = randf_range(0.5,1.5)
			time_espera = 1
			$giro.play("giro")
	super._process(delta)
	pass
