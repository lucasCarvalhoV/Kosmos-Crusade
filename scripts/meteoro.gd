extends Area2D

var center; # centro da circunferência
var mov = Vector2()
var radius = 150 # raio da circunferência
var angle = 0 # ângulo de rotação em graus
const DEG2RAD = PI/180
var speed = 100
var fatorVelocidade = 0.1;
var fatorRaio = 0.5;
var leftRotation;
var up;
var isThereWormHole = true;
var inicio;

func _ready():
	center = global_position;
	leftRotation = center.x <= 1000
	up = center.y > 500
	pass 

func _process(delta):
	
	if(isThereWormHole):
		if(leftRotation):
			angle += (fatorVelocidade/0.1)*(speed * delta)
		else:
			angle -= (fatorVelocidade/0.1)*(speed * delta)
		
	radius += fatorRaio
	speed += fatorVelocidade
	
	if(!isThereWormHole):
		fatorVelocidade = 35
		fatorRaio = 35
	
	if(radius == 654 && isThereWormHole):
		fatorVelocidade = -0.1
		fatorRaio = -0.5
	elif(radius == 150 && isThereWormHole):
		fatorVelocidade = 0.1
		fatorRaio = 0.5

	mov.x = center.x - (radius * cos(angle * DEG2RAD))
	mov.y = center.y - (radius * sin(angle * DEG2RAD)) 
	position = mov
	pass


func _on_area_entered(area):
	if area.is_in_group(game.JOGADOR):
		area.setDurabilidade(area.durabilidade -1)
		get_tree().call_group("camera","tremer",1)
		queue_free()
