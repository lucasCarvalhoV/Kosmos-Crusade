extends Sprite2D

var speed = Vector2()
const gravity = 6
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed.y = gravity + delta
	translate(speed)
	if position.y >= get_viewport_rect().size.y-110:
		position.y = -231
	pass
