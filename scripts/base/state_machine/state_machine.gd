extends Node


@export
var initial_state: State

var current_state: State

# Initialize the state machine by giving each child state a reference to the
# parent object
func init(parent: CharacterBody2D, animations: AnimatedSprite2D, input_component) -> void:
	for child in get_children():
		child.parent = parent
		child.animations = animations
		child.input_component = input_component

	# Initialize the default state
	change_state(initial_state)

# Change to the new state 
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()
	
# Pass through functions for the Player to call,
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
