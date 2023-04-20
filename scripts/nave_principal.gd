extends Area2D

const scan_laser = preload("res://scenes/laser_nave.tscn")
var vel = 300
var intervalo = 0.3
var ultimo_disparo = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
			var tiro_E = scan_laser.instantiate()
			var tiro_D = scan_laser.instantiate()
			tiro_E.position = get_node("canhoes/esquerda").global_position
			tiro_D.position = get_node("canhoes/direita").global_position
			get_node("../").add_child(tiro_E)
			get_node("../").add_child(tiro_D)
			ultimo_disparo = intervalo
		pass
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
		pass
	position.x += mov.x * vel * delta
	position.y += mov.y * vel * delta
	position.x = clamp(position.x,45,view_size.x-45)
	position.y = clamp(position.y,20,view_size.y-80)
	pass
