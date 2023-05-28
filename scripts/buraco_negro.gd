extends Node2D

const meteoro = preload("res://scenes/meteoro.tscn");

var meteoro1;
var meteoro2;
var meteoro3;
var meteoro4;

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
		
	
	pass



func _on_area_entered(area):
	if area.is_in_group(game.JOGADOR):
		area.setDurabilidade(area.durabilidade - 10)
