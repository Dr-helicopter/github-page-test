extends Node2D


@export var roller : Node2D
@export var time := 3.0

@export var min_height := -100
@export var max_height := 100


const obsticle = preload("res://scenes/obsticle.tscn")


@onready var timer : Timer = $"Timer"





func _ready() -> void:
	timer.timeout.connect(add_obst)
	timer.start(time)



func add_obst():
	var new_obs = obsticle.instantiate()
	new_obs.position = position - roller.position
	new_obs. position. y = randf_range(min_height, max_height)
	roller.add_child(new_obs)
	timer.start(time)
