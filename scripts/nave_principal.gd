extends Area2D

const scan_laser = preload("res://scenes/laser.tscn")
var vel = 400
var intervalo = 0.2
var ultimo_disparo = 0
var durabilidade = game.PC_HP

signal hitted
signal game_over

# Função chamada ao carregar elemeto
func _ready():
	add_to_group(game.JOGADOR)
	set_process(true)
	
	pass

# Função executada a cada frame 
func _process(delta):
	
	var view_size = get_viewport_rect().size
	var mov = Vector2()
	if Input.is_action_pressed("right"):
		mov.x += 1
	if Input.is_action_pressed("left"):
		mov.x -= 1
	if Input.is_action_pressed("down"):
		mov.y += 1
	if Input.is_action_pressed("up"):
		mov.y -= 1
	if Input.is_action_pressed("atirar"):
		if ultimo_disparo <= 0:
			atirar(get_node("canhoes/esquerda"))
			atirar(get_node("canhoes/direita"))
			ultimo_disparo = intervalo
		pass
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
		pass
	position.x += mov.x * vel * delta
	position.y += mov.y * vel * delta
	position.x = clamp(position.x,45,view_size.x-45)
	position.y = clamp(position.y,45,view_size.y-40)
	pass


	
func atirar(node):
	var tiro = scan_laser.instantiate()
	tiro.position = node.global_position
	get_node("../").add_child(tiro)
	pass
	

func setDurabilidade(nova_durabilidade):
	durabilidade = nova_durabilidade
	hitted.emit()
	if durabilidade <= 0:
		game_over.emit()
		queue_free()	
	pass
	
