extends Area2D

const bullet = preload("res://scripts/area_2d.tscn")
var time = randf_range(0.5,1.5)
var time_espera = 2.5
var vida = 2
var gravidade = 500	
var mov = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(game.GRUPO_INIMIGO)
	$giro.play("giro")
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	if(time <= 0):
		mov.y = 0
		gravidade = 0
		time_espera -= delta
		$Sprite2D.play("minion")
		var disparos = bullet.instantiate()
		disparos.global_position = position
		get_node("../").add_child(disparos)
		if(time_espera <= 0):
			time = randf_range(0.5,1.5)
			time_espera = 1
			$giro.play("giro")
	mov.y = gravidade * delta
	translate(mov)
	if position.y - 16 >= get_viewport_rect().size.y:
		queue_free()
	pass
	
func sofre_dano(valor):
	vida -= valor
	if vida <= 0:
		queue_free()
	pass
		

func _on_area_entered(area):
	if area.is_in_group(game.JOGADOR):
		area.setDurabilidade(area.durabilidade -1)
		queue_free()

	pass # Replace with function body.
