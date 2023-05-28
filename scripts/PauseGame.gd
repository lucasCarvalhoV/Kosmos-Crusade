extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed("pause") && !event.is_echo():
		get_tree().paused = !get_tree().paused
		if get_tree().paused == true:
			$Pausa.show()
		else:
			$Pausa.hide()
pass
	
