extends Sprite2D

var speed = Vector2()
const gravity = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed.y = gravity + delta
	translate(speed)
	if position.y >= get_viewport_rect().size.y:
		position.y = -600
		
	pass
