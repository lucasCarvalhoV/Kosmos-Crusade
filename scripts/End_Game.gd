extends CanvasLayer

@onready var musicaFundo:AudioStreamPlayer = $"../MusicaFundo"

@onready var destroyed_SFX_A:AudioStreamPlayer2D = $gameover_SFX_A
@onready var destroyed_SFX_B:AudioStreamPlayer2D = $gameover_SFX_B
@onready var destroyed_SFX_C:AudioStreamPlayer2D = $gameover_SFX_C

@onready var temaVitoriaB:AudioStreamPlayer2D = $vitoria_B

@onready var won_SFX_A:AudioStreamPlayer2D = $gameover_SFX_A
@onready var won_SFX_B:AudioStreamPlayer2D = $gameover_SFX_B
@onready var won_SFX_C:AudioStreamPlayer2D = $gameover_SFX_C


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_nave_principal_game_over():
	while musicaFundo.volume_db > -30:
		musicaFundo.volume_db = musicaFundo.volume_db - 1
	gameoverSFXSelect()
	$Game_over.show()
	pass # Replace with function body.



func _on_p_lay_again_pressed():
	musicaFundo.volume_db = -10
	get_tree().change_scene_to_file("res://stages/stage_game.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_ovini_inimigo_victory():
	musicaFundo.stop()
	victorySFXSelect()
	$Victory.show()
	get_tree().paused = true
	pass # Replace with function body.


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
	pass # Replace with function body.

func gameoverSFXSelect():
	var chosenSFX = randi_range(0,2)
	if chosenSFX == 0:
		destroyed_SFX_A.play()
	elif chosenSFX == 1:
		destroyed_SFX_B.play()
	elif chosenSFX == 2:
		destroyed_SFX_C.play()
	
func victorySFXSelect():
	temaVitoriaB.play()
