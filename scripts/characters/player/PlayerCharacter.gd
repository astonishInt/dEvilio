extends CharacterBody2D

@export var speed = 20
@export var health = 200
@export var ally_squads = []

@onready
var movement_animations: AnimatedSprite2D = $CharacterAnimation

@onready
var player_state_machine: Node = $player_state_machine

@onready
var player_input_controller = $player_input_controller

func _ready() -> void:
	player_state_machine.init(self, movement_animations, player_input_controller)


func _unhandled_input(event: InputEvent) -> void:
	player_state_machine.process_input(event)


func _physics_process(delta: float) -> void:
	player_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	player_state_machine.process_frame(delta)

