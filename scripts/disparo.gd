extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_node("disparar").play("disparar")
	_on_disparar_animation_finished("disparar")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_disparar_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.
