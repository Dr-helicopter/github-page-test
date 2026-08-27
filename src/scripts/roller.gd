extends Node2D


@export var speed := 400.0


var rolling := true


func _physics_process(delta: float) -> void:
	if not rolling: return
	position.x -= speed  * delta



func _on_bird_dead() -> void:
	rolling = false
