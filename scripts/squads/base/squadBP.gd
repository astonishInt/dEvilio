extends Node

class_name SquadBP

var health: int = 0
var damage: int = 0
var attack_range: int = 0
var squad_race: DConstants.SquadRace;
var squad_type: DConstants.SquadType;
var squad_size: int = 0
var unit_scene: PackedScene

func _init(i_health: int, i_damage: int, i_attack_range: int, i_squad_race: DConstants.SquadRace):
	health = i_health
	
