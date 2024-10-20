extends Control

@onready var start_level = preload("res://scenes/base/game_view.tscn") as PackedScene
@onready var start_button = $VBoxContainer/StartButton as Button
@onready var options_button = $VBoxContainer/OptionsButton as Button
@onready var exit_button = $VBoxContainer/QuitButton as Button

func _ready():
	start_button.button_down.connect(on_start_button_down)		
	exit_button.button_down.connect(on_exit_button_down)	
	options_button.button_down.connect(on_option_button_down)
	
func on_start_button_down() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_exit_button_down() -> void:
	get_tree().quit()

func on_option_button_down() -> void:
	pass
