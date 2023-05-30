extends Node2D

const meteoro = preload("res://scenes/meteoro.tscn");

var meteoro1;
var meteoro2;
var meteoro3;
var meteoro4;
var moved = false
var mov = Vector2()
const speed = 500
var intervalo = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !moved:
		if position.y <= 500:
			mov.y = delta*speed
			translate(mov)
			print(position.y)
		if position.y >= 500:
			moved = true
		
	if(meteoro1 == null and meteoro2 == null and meteoro3 == null and meteoro4 == null):
		
		meteoro1 = meteoro.instantiate();
		meteoro2 = meteoro.instantiate();
		meteoro3 = meteoro.instantiate();
		meteoro4 = meteoro.instantiate();
		
		meteoro1.position = get_node("spawn_meteoro1").global_position;
		meteoro2.position = get_node("spawn_meteoro2").global_position;
		meteoro3.position = get_node("spawn_meteoro3").global_position;
		meteoro4.position = get_node("spawn_meteoro4").global_position;
		
		get_node("../").add_child(meteoro1);
		get_node("../").add_child(meteoro2);
		get_node("../").add_child(meteoro3);
		get_node("../").add_child(meteoro4);
	intervalo -= delta
	if intervalo <= 0:
		meteoro1.isThereWormHole = false
		meteoro2.isThereWormHole = false
		meteoro3.isThereWormHole = false
		meteoro4.isThereWormHole = false
		queue_free()
	
	pass



func _on_area_entered(area):
	if area.is_in_group(game.JOGADOR):
		area.setDurabilidade(area.durabilidade - 10)
