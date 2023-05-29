extends Area2D

var mov = Vector2()
const speed = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	$EB.play("enemy_bullet")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mov.y = speed*delta
	mov.x = (-speed)*delta
	translate(mov)
	if (global_position.y > (get_viewport_rect().size.y + 30)):
		get_node("../").queue_free()
	pass


func _on_area_entered(area):
	if area.is_in_group(game.JOGADOR):
		area.setDurabilidade(area.durabilidade -1)
		get_tree().call_group("camera","tremer",5.0)
		queue_free()
	pass # Replace with function body.
