extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos_x = 125
	var pos_y = 200
	var motion_x = (get_global_mouse_position().x - pos_x)
	var motion_y = (get_global_mouse_position().y - pos_y)
	pos_x += motion_x
	pos_y += motion_y
	var view_size = get_viewport_rect().size
	pos_x = clamp(pos_x,32,view_size.x-32)
	pos_y = clamp(pos_y,32,view_size.y-32)
	global_position = Vector2(pos_x,pos_y)
