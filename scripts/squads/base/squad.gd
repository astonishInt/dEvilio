extends Node2D


class_name Squad


@export var health: int = 0
@export var damage: int = 0
@export var attack_range: int = 0
@export var squad_race: DConstants.SquadRace;
@export var squad_type: DConstants.SquadType;
@export var squad_size: int = 0
@export var unit_scene: PackedScene

var target_position = Vector2.ZERO
var units = []

func _ready():
	for i in range(squad_size):
		print("Squad Size", squad_size)
		var unit_instance = unit_scene.instantiate()
		print("After unit_instance assigned")
		units.append(unit_instance)
		print("After unit_instance appended to array")
		for pos in range($Positions.get_child_count()):
			print(pos)
			if $Positions.get_child(pos).get_child_count() == 0:
				print($Positions.get_child(pos))
				print('found empty')
				$Positions.get_child(pos).add_child(unit_instance)
				break
			


func set_target_position(new_target_position):
	target_position = new_target_position
	for unit in units:
		unit.move_to_target(target_position)
	
func attack(target: Squad):
	var don_damage = calculate_damage(target) 
	target.take_damage(don_damage)
	
func calculate_damage(target: Squad) -> int:
	var base_damage = damage
	
	match squad_type:
		DConstants.SquadType.WARRIOR:
			if target.squad_type == DConstants.SquadType.ARCHER:
				return base_damage * 1.5
			elif target.squad_type == DConstants.SquadType.PIKEMEN:
				return base_damage * 1.25
			elif target.squad_type == DConstants.SquadType.CAVALRY:
				return base_damage * 0.75
		DConstants.SquadType.ARCHER:
			if target.squad_type == DConstants.SquadType.WARRIOR:
				return base_damage * 1.25
			elif target.squad_type == DConstants.SquadType.MONSTROSITY:
				return base_damage * 1.25
		DConstants.SquadType.PIKEMEN:
			if target.squad_type == DConstants.SquadType.CAVALRY:
				return base_damage * 1.50
			elif target.squad_type == DConstants.SquadType.MONSTROSITY:
				return base_damage * 1.25
		DConstants.SquadType.CAVALRY:
			if target.squad_type == DConstants.SquadType.WARRIOR:
				return base_damage * 1.25
			elif target.squad_type == DConstants.SquadType.ARCHER:
				return base_damage * 1.50
			elif target.squad_type == DConstants.SquadType.PIKEMEN:
				return base_damage * 0.75
			elif target.squad_type == DConstants.SquadType.MAGIC:
				return base_damage * 1.25
			elif target.squad_type == DConstants.SquadType.MONSTROSITY:
				return base_damage * 0.50
		DConstants.SquadType.MAGIC:
			if target.squad_type == DConstants.SquadType.MONSTROSITY:
				return base_damage * 1.50
		DConstants.SquadType.MONSTROSITY:
			if target.squad_type == DConstants.SquadType.WARRIOR:
				return base_damage * 1.25
			elif target.squad_type == DConstants.SquadType.ARCHER:
				return base_damage * 1.25
			elif target.squad_type == DConstants.SquadType.PIKEMEN:
				return base_damage * 1.25
			elif target.squad_type == DConstants.SquadType.CAVALRY:
				return base_damage * 1.50
			elif target.squad_type == DConstants.SquadType.MAGIC:
				return base_damage * 0.75
	return base_damage


func take_damage(inc_damage: int):
	health -= inc_damage
	if health <= 0:
		die()


func die():
	queue_free()
