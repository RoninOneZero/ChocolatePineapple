extends Node2D

@onready var time_display: Label = $TimeDisplay
@onready var ticker: Timer = $Ticker

var seconds_left: int = 60 : set = set_seconds_left
var clock_active: bool = false

signal time_elapsed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_clock()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start_clock(seconds: int = 60) -> void:
	seconds_left = seconds
	clock_active = true
	ticker.start()


func _on_ticker_timeout() -> void:
	seconds_left -= 1
	if seconds_left <= 0:
		ticker.stop()
		emit_signal("time_elapsed")

func set_seconds_left(value: int) -> void:
	seconds_left = value
	time_display.text = str(seconds_left)
