class_name Monster
extends Node2D

@export var health_label: Label
@export var max_health: int = 420 

signal monster_died

var current_health: int = max_health : set = set_health

signal health_changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = current_health # Inits health for signal


func damage(amount: int = 69) -> void:
	current_health -= amount

func set_health(val: int) -> void:
	current_health = val
	health_label.text = "ENEMY: %s/%s" % [val, max_health]
	# Check dead
	if current_health <= 0:
		emit_signal("monster_died")
		queue_free()
