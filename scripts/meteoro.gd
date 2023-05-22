extends Area2D

var center; # centro da circunferência
var mov = Vector2()
var radius = 150 # raio da circunferência
var angle = 0 # ângulo de rotação em graus
const DEG2RAD = PI/180
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	center = global_position;	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	
	var leftRotation = center.x <= 1000
	
	if(leftRotation):
		angle += speed * delta
	else:
		angle += speed * delta
		
	radius += 0.1
	speed += 0.1
	mov.x = center.x - (radius * cos(angle * DEG2RAD))
	mov.y = center.y - (radius * sin(angle * DEG2RAD)) 
	position = mov
	pass
