extends Sprite2D

@onready var minigame: Minigame = $Minigame
@onready var animator: AnimationPlayer = $AnimationPlayer

var console_hidden: bool = true
var allow_input: bool = true

signal game_won

func _input(event):
	if event.is_action_pressed("hide") and allow_input:
		toggle_hidden()
	
	if event.is_action_pressed("debug1"):
		_on_minigame_game_won()



func _hide_console() -> void:
	console_hidden = true
	animator.play("hide")
	minigame.pause_game()

func _unhide_console() -> void:
	console_hidden = false
	animator.play("unhide")
	await animator.animation_finished
	minigame.unpause_game()

func stop() -> void:
	allow_input = false
	minigame.pause_game()

func toggle_hidden() -> void:
	if console_hidden:
		_unhide_console()
	else:
		_hide_console()
	

func _on_minigame_game_won() -> void:
	allow_input = false
	emit_signal("game_won")
