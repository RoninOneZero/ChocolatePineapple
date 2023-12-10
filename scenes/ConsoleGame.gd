class_name Minigame
extends Node2D

@onready var progress_bar : ProgressBar = $Control/ProgressBar
@onready var status_label : Label = $Control/Label
@onready var ticker: Timer = $Ticker

var progress: int = 0 : set = set_progress

signal game_won

func pause_game() -> void:
	status_label.text = "PAUSED!!"
	ticker.stop()

func unpause_game() -> void:
	status_label.text = "PLAYING..."
	ticker.start()

func _on_timer_timeout() -> void:
	progress += 1
	if progress >= 100:
		win_game()

func win_game() -> void:
	status_label.text = "YOU WIN!"
	ticker.stop()
	emit_signal("game_won")

func set_progress(value: int) -> void:
	progress = clamp(0, value, 100)
	progress_bar.value = progress

