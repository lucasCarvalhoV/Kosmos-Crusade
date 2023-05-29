extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_nave_principal_game_over():
	show()
	pass # Replace with function body.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.
