extends State

@export
var skill_state: State

@export
var order_attack_state: State
@export
var order_retreat_state: State
@export
var move_state: State

func enter() -> void:
	super()
	parent.velocity = Vector2(0,0)

func process_input(_event: InputEvent) -> State:
	if get_movement_input().x != 0 || get_movement_input().y != 0:
		return move_state
	var order = get_order_input()
	if order != null:
		if order == Constants.Orders.ATTACK:
			return order_attack_state
		if order == Constants.Orders.RETREAT:
			return order_retreat_state
	return null
	
func process_physics(_delta: float) -> State:
	return null
