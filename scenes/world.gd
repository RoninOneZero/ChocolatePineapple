extends Node2D

@onready var animator := $AnimationPlayer
@onready var handheld := $Handheld


var handheld_hidden := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event):
	if event.is_action_pressed("hide"):
		hide_handheld()

func hide_handheld() -> void:
	if handheld_hidden:
		animator.play_backwards("game_hide")
		await animator.animation_finished
		handheld_hidden = false
	else: 
		animator.play("game_hide")
		await animator.animation_finished
		handheld_hidden = true

func _on_clock_time_elapsed() -> void:
	print("You Win!")
