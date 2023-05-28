extends Camera2D

var angle = 0
var forca = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if forca > 0:
		angle += delta*100
		global_position = Vector2(forca,forca).rotated(angle)
		forca = lerp(forca,0.0,0.05)
	pass
	
func tremer(valor):
	forca = valor
	pass
