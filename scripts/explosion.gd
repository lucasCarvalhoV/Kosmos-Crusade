extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$GPUParticles2D.emitting = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !$GPUParticles2D.emitting:
		queue_free()
	pass
