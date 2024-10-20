extends Node

@export
var parent: CharacterBody2D

# Return the desired direction of movement for the character
func get_movement_direction() -> Vector2:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	return input_direction * parent.speed

func get_order():
	if Input.is_action_pressed("primaryClick"):
		return Constants.Orders.ATTACK
	if Input.is_action_pressed("secondaryClick"):
		return Constants.Orders.RETREAT

func get_skill():
	if Input.is_action_pressed("basicSkill"):
		return Constants.Skills.CHARGE
	if Input.is_action_pressed("secondarySkill"):
		return Constants.Skills.FIREBALL
