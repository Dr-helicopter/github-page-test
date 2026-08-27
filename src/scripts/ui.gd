extends Control

@onready var label : Label = $"Label"

@export var death_label : Label
@export var death_panel: Control

func set_score(score: int):
	label.text = "score: " + str(score)



func show_death_screan(score: int):
	death_label.text = "your score: " + str(score)
	death_panel.show()




func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
