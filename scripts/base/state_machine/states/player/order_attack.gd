extends State

@export
var idle_state: State

@export
var move_state: State

# Since these states can't trigger a state change from an internal event,
# just track when animation is finished and exit the next frame depends on what 
# player is doing return to walk or idle state
var is_complete := false

func enter() -> void:
	is_complete = false
	super()
	await animations.animation_finished
	is_complete = true

func process_frame(_delta: float) -> State:
	if parent.velocity.x < 0:
		animations.flip_h = true
	elif parent.velocity.x > 0:
		animations.flip_h = false
	
	if is_complete:
		if get_movement_input().x != 0 || get_movement_input().y != 0:
			return move_state
		else:
			return idle_state
	return null
