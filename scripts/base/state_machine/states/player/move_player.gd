extends State


@export
var idle_state: State
@export
var skill_state: State


# States for Player Character
@export
var order_attack_state: State
@export
var order_retreat_state: State


func process_input(_event: InputEvent) -> State:
	if get_order_input() == Constants.Orders.ATTACK:
		return order_attack_state
	if get_order_input() == Constants.Orders.RETREAT:
		return order_retreat_state
	return null

func process_physics(_delta: float) -> State:
	var movement = get_movement_input() * move_speed
	
	if movement.x == 0 && movement.y == 0:
		return idle_state
	
	animations.flip_h = movement.x < 0
	parent.velocity = movement
	parent.move_and_slide()
	
	return null
