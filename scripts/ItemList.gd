extends ItemList


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_selected(index):
	match index:
		0:
			get_tree().change_scene_to_file("res://stages/stage_game.tscn")
			pass
		1:
			print("Options")
			pass
		2:
			get_tree().quit()
			pass
	pass # Replace with function body.
