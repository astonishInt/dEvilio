extends CharacterBody2D

@export var speed: int = 20
@export var health: int = 200
@export var ally_squads: Array[Squad] = []

@onready
var movement_animations: AnimatedSprite2D = $CharacterAnimation

@onready
var player_state_machine: Node = $player_state_machine

@onready
var player_input_controller = $player_input_controller

func _ready() -> void:
	player_state_machine.init(self, movement_animations, player_input_controller)
	create_proto_initial_squads()
	place_squads()

func _unhandled_input(event: InputEvent) -> void:
	player_state_machine.process_input(event)


func _physics_process(delta: float) -> void:
	player_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	player_state_machine.process_frame(delta)

func create_proto_initial_squads():
	var firstSquad: Squad = Squad.create_new_squad(100, 20, 20,  DConstants.SquadRace.UNDEAD,  DConstants.SquadType.WARRIOR, 5, preload("res://scenes/characters/Ally Squad Characters/1_unit_skelet_warrior.tscn"))
	var secondSquad: Squad = Squad.create_new_squad(100, 20, 20,  DConstants.SquadRace.UNDEAD,  DConstants.SquadType.WARRIOR, 5, preload("res://scenes/characters/Ally Squad Characters/1_unit_skelet_warrior.tscn"))
	ally_squads = [firstSquad, secondSquad]

func place_squads():
	for squad in ally_squads:
		for pos in range($SquadPlacments.get_child_count()):
			if $SquadPlacments.get_child(pos).get_child_count() == 0:
				$SquadPlacments.get_child(pos).add_child(squad)
				break
