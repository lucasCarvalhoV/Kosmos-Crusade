extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_nave_principal_game_over():
	$Game_over.show()
	pass # Replace with function body.



func _on_p_lay_again_pressed():
	get_tree().change_scene_to_file("res://stages/stage_game.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_ovini_inimigo_victory():
	$Victory.show()
	get_tree().paused = true
	pass # Replace with function body.


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
	pass # Replace with function body.
