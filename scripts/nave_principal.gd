extends Area2D

var vel = 8
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var view_size = get_viewport_rect().size
	var mov = Vector2()
	if Input.is_action_pressed("right"):
		mov.x += 1
	if Input.is_action_pressed("left"):
		mov.x -= 1
	if Input.is_action_pressed("down"):
		mov.y += 1
	if Input.is_action_pressed("up"):
		mov.y -= 1
	position.x += mov.x * vel + delta
	position.y += mov.y * vel + delta
	position.x = clamp(position.x,45,view_size.x-45)
	position.y = clamp(position.y,20,view_size.y-80)
	
	pass
