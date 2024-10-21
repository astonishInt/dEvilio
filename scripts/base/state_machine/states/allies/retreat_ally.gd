extends State

@export
var idle_state: State

@export
var follow_state: State

@export
var move_to_state: State

@export
var attack_state: State


func enter() -> void:
	super()
	parent.velocity = Vector2(0,0)

func process_input(_event: InputEvent) -> State:

	return null
	
func process_physics(_delta: float) -> State:
	return null
