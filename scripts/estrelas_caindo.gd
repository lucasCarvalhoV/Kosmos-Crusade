extends Sprite2D

var velocidade = Vector2()
const grav = 6
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocidade.y = grav + delta
	translate(velocidade)
	if position.y >= (get_viewport_rect().size.y-110):
		position.y = -231
	pass
