extends Node2D


var searching: bool = false

@onready var timer: Timer = $Timer
@onready var animator: AnimationPlayer = $AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(randomized_time(5.0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func stop() -> void:
	timer.stop()

func enter_room() -> void:
	animator.play("enter_room")
	await animator.animation_finished
	searching = true
	timer.start(randomized_time(2.0))

func exit_room() -> void:
	animator.play_backwards("enter_room")
	await animator.animation_finished
	searching = false
	timer.start(randomized_time(8.0))

# Starts timer with randomized duration around the value of base seconds
func randomized_time(base_seconds: float) -> float:
	var modifier_range = base_seconds * 0.5
	var modifier := randf_range(modifier_range, -modifier_range)
	print(base_seconds + modifier)
	return base_seconds + modifier



func _on_timer_timeout() -> void:
	if searching:
		exit_room()
	else:
		enter_room()
