extends Node2D

@export var monster_scene: PackedScene
var monster: Monster = null

@export var defeat_label: Label
@export var win_count_label: Label 

@onready var attack_cd: Timer = $AttackCD
@onready var enemy_cd: Timer = $EnemyCD

var damage: int = 0
var win_count := 0 : set = set_win_count

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	defeat_label.hide()
	spawn_monster()


func _input(event: InputEvent) -> void:
	if monster != null and event.is_action_pressed("left"):
		if attack_cd.is_stopped():
			attack_cd.start()
			monster.damage()


func _on_monster_died() -> void:
	win_count += 1
	defeat_label.show()
	await get_tree().create_timer(1.3).timeout
	defeat_label.hide()
	spawn_monster()


func spawn_monster() -> void:
	monster = monster_scene.instantiate()
	monster.connect("monster_died", _on_monster_died)
	add_child(monster)

func set_win_count(val: int) -> void:
	win_count = val
	win_count_label.text = "Wins: %s" % win_count


func _on_enemy_cd_timeout() -> void:
	damage += 1
	print("Ouch" + str(damage))
	if damage >= 10:
		print ("You died")
