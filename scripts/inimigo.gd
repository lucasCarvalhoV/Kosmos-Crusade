extends Area2D


var mov= Vector2()
var gravidade = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mov.y = gravidade * delta
	translate(mov)
	if position.y - 16 >= get_viewport_rect().size.y:
		queue_free()
	pass
