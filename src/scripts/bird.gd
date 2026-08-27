extends CharacterBody2D

signal dead

@export var jump_power := -400.0
@export var gravity := 980.0
@export var sprite: Sprite2D



var alive := true
var score := 0


func _physics_process(delta: float) -> void:
	if not alive: return

	# Add the gravity.
	if not is_on_floor():
		velocity.y +=  gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_power

	move_and_slide()
	sprite.rotation = deg_to_rad(velocity.y  * 0.05)


func die():
	alive = false
	dead.emit()

func add_score():
	score += 1
	%"UI".set_score(score)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Obsticle: 
		add_score()
	else:
		die()
		%"UI".show_death_screan(score)
