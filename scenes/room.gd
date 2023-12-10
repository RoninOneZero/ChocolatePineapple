extends Node2D

@onready var countdown: Timer = $Countdown
@onready var gwen: Node2D = $Gwen
@onready var console: Node2D = $Console
@onready var defeat_overlay: Control = $Control/DefeatOverlay
@onready var overlay_label: Label = $Control/DefeatOverlay/Label
@onready var countdown_display: Label = $Control/CountdownDisplay

var state = "Running"

func _ready() -> void:
	countdown_display.text = str(round(countdown.wait_time))
	defeat_overlay.hide()

func _process(_delta: float) -> void:
	countdown_display.text = str(round(countdown.time_left))


	if gwen.searching and !console.console_hidden and state == "Running":
		state = "Defeat"
		gwen.stop()
		console.stop()
		defeat_overlay.show()

func return_to_main() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
			

func _on_console_game_won() -> void:
		state = "Victory"
		gwen.stop()
		console.stop()
		overlay_label.text = "You Win!"
		defeat_overlay.show()


func _on_countdown_timeout() -> void:
	state = "Defeat"
	gwen.stop()
	console.stop()
	defeat_overlay.show()
