extends Area2D

var mov = Vector2()
var speed = -1000

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	$Sprite2D.play("hero_bullet")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mov.y = speed*delta
	translate(mov)
	if (position.y < -30):
		queue_free()
	pass


func _on_area_entered(area):
	if area.is_in_group(game.GRUPO_INIMIGO):
		if area.has_method("sofre_dano"):
			area.sofre_dano(1)
		else:
			area.queue_free()
		queue_free()
	pass # Replace with function body.
