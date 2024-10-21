extends Node

class_name SquadBP

@export var health: int = 0
@export var damage: int = 0
@export var attack_range: int = 0
@export var squad_race: DConstants.SquadRace;
@export var squad_type: DConstants.SquadType;
@export var squad_size: int = 0
@export var unit_scene: PackedScene

func _init(i_health: int, i_damage: int, i_attack_range: int, i_squad_race: DConstants.SquadRace, i_squad_type: DConstants.SquadType, i_squad_size: int, i_unit_scene: PackedScene):
	health = i_health
	damage = i_damage
	attack_range = i_attack_range
	squad_race = i_squad_race
	squad_type = i_squad_type
	squad_size = i_squad_size
	unit_scene = i_unit_scene
