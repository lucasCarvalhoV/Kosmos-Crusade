extends Area2D

var mov = Vector2.ZERO
var speed = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var screen_size = get_viewport_rect().size
	if position.x == 350 or position.x == screen_size.x-350:
		speed = speed*(-1)
	mov.x = speed+delta
	translate(mov)
	position.x = clamp(position.x,350,screen_size.x-350)
	
	
	
	pass
