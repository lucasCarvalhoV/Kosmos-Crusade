extends Area2D

const scan_laser = preload("res://scenes/laser_ovni.tscn")
const scan_buraco_negro = preload("res://scenes/buraco_negro.tscn")
var mov = Vector2.ZERO
var speed = 5
var intervalo = 0.6
var ultimo_disparo = 0
var vida_total = game.BOSS_HP
var vida = vida_total
var disparos_dispersos = true
signal hitted
signal segunda_fase
signal terceira_fase
var ultimo_spawn = 0
var fase_tres = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(game.GRUPO_INIMIGO)
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var screen_size = get_viewport_rect().size
	if position.x == 380 or position.x == screen_size.x-350:
		speed = speed*(-1)
	mov.x = speed+delta
	translate(mov)	
	position.x = clamp(position.x,380,screen_size.x-350)
	if ultimo_disparo <= 0 and disparos_dispersos:
		disparo(get_node("Disparadores/laser_E"))
		disparo(get_node("Disparadores/laser_C"))
		disparo(get_node("Disparadores/laser_D"))
		ultimo_disparo = intervalo
	
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
		
	if fase_tres:
		ultimo_spawn -= delta
		if (ultimo_spawn <= 0):
			var buraco_negro = scan_buraco_negro.instantiate()
			print(position)
			buraco_negro.global_position = get_node("Disparadores/laser_C").global_position
			get_node("../").add_child(buraco_negro)	
			ultimo_spawn = 2

func disparo(node):
	var laser = scan_laser.instantiate()
	laser.global_position = node.global_position
	get_node("../").add_child(laser)

func sofre_dano(valor):
	vida -= valor
	hitted.emit()
	if vida <= 0:
		queue_free()
	elif vida <= vida_total/3:
		terceira_fase.emit()
		fase_tres = true
	elif vida == vida_total/3 * 2:
		disparos_dispersos= false
		speed = 8
		segunda_fase.emit()

func _on_area_entered(area):
	if area.is_in_group(game.JOGADOR):
		area.setDurabilidade(area.durabilidade -10)
		

