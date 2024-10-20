extends CharacterBody2D

class_name Unit

var animation_delay = 0.2
@onready var sprite = $UnitAnimation

func _ready():
	animation_delay = randi() % 100 / 100.0  # Losowa wartość między 0 a 1
	sprite.stop()  # Zatrzymaj animację na starcie
	
	get_tree().create_timer(animation_delay)
	playIdle()


func playIdle():
	sprite.play("idle")
	
func playAttack():
	sprite.play("attack")
	
func playWalk():
	sprite.play("walk")
	
func move_to_target(target_position, speed, delta):
	var direction = (target_position - position).normalized()
	position += direction * speed * delta
