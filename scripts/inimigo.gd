extends Area2D


var speed= Vector2()
var gravidade = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed.y = gravidade + delta
	translate(speed)
	if position.y - 16 >= get_viewport_rect().size.y:
		queue_free()
	pass
