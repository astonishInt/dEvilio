class_name State
extends Node

@export
var animation_name: String

@export
var move_speed: float = 400

var animations: AnimatedSprite2D
var input_component
var parent: CharacterBody2D

func enter() -> void:
	if animation_name:
		animations.play(animation_name)
	
func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null

func get_movement_input() -> Vector2:
	return input_component.get_movement_direction()
	
func get_skill_input():
	return input_component.get_skill()
	
func get_order_input():
	return input_component.get_order()
