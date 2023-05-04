extends Control

@onready var bossHPbar := $BOSS_HP
@onready var pcHPbar := $PC_HP

var playerHP = game.PC_HP
var bossHP = game.BOSS_HP

func _ready():
	setHealthBars()
	set_process(true)
	pass
	
func _process(delta):
	pass
	
func setHealthBars():
	setupPCHP()
	setupBOSSHP()
	pcHPbar.value = clamp(playerHP,0,game.PC_HP)
	bossHPbar.value =  clamp(bossHP,0,game.BOSS_HP)
	pass
	
func setupPCHP():
	pcHPbar.min_value = 0
	pcHPbar.max_value = game.PC_HP
	pass

func setupBOSSHP():
	bossHPbar.min_value = 0
	bossHPbar.max_value  = game.BOSS_HP
	pass

func _on_nave_principal_ready():
	pass
	

func _on_nave_principal_hitted():
	playerHP -= 1
	pcHPbar.value  -= 1

func _on_ovini_inimigo_hitted():
	bossHP -= 1
	bossHPbar.value -= 1
