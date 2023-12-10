extends Node

@export var packed_game: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var game_instance = packed_game.instantiate()
	add_child(game_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
