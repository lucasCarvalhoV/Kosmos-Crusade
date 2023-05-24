extends Node2D

const kamikaze = preload("res://scenes/inimigo_explosivo.tscn")
var intervalo = 1.5
var ultimo_spawn = 0
var ativado = ""
# Called when the node enters the scene tree for the first time.
const delay = 200000
func _ready():	
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

		randomize()
		var inimigo = kamikaze.instantiate()
		var posicao = Vector2()
		if ultimo_spawn <= 0:
			posicao.x = randi_range(16,get_viewport().get_visible_rect().size.x-16)
			posicao.y = 16
			inimigo.position = posicao
			get_node("container").add_child(inimigo)
			ultimo_spawn = intervalo
		pass
		if ultimo_spawn > 0:
			ultimo_spawn -= delta
		pass




func _on_ovini_inimigo_segunda_fase():
	set_process(true)



func _on_ovini_inimigo_terceira_fase():
		set_process(false)
