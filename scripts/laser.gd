extends Area2D

var mov = Vector2()
var speed = -700

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mov.y = speed*delta
	translate(mov)
	if (position.y < -30) or (position.y > (get_viewport_rect().size.y + 30)):
		print("Apagando")
		queue_free()
		print("Apagador")
	pass




