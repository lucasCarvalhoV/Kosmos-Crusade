extends CanvasLayer

@onready var musicaFundo:AudioStreamPlayer = $"../MusicaFundo"

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
			musicaFundo.volume_db = -30
			show()
		else:
			musicaFundo.volume_db = -20
			hide()
pass
	


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.
