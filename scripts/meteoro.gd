
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
	center = position;
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
		fatorVelocidade = 25
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
		get_tree().call_group("camera","tremer",5.0)
		queue_free()
		
