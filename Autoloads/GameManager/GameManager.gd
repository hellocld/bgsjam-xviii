extends Node


var _player : BaseCreature setget set_player,get_player
var _hallway_manager : HallwayManager setget set_hallway_manager,get_hallway_manager
var gravity = Vector3(0, -0.4, 0)
var in_hall_transition := false

var lives := 3
var score := 0

var game_over = false

func _ready() -> void:
	randomize()
	EventBus.connect("hall_completed", self, "_on_hall_completed")
	EventBus.connect("hall_start", self, "_on_hall_start")
	EventBus.connect("game_start", self, "_on_game_start")
	EventBus.connect("enemy_killed", self, "_on_enemy_killed")
	EventBus.connect("player_killed", self, "_on_player_killed")
	EventBus.connect("game_over", self, "_on_game_over")
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	_initialize_game()


func _process(_delta) -> void:
	if game_over:
		if Input.is_action_just_pressed("ui_accept"):
			_initialize_game()
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
			


func _initialize_game() -> void:
	game_over = false
	EventBus.emit_signal("main_menu")
	get_tree().change_scene("res://Scenes/AAA_Primary/StartScreen/StartScreen.tscn")



func _on_enemy_killed(points) -> void:
	score += points
	EventBus.emit_signal("score_changed")
	if score > 0 && score % 10000 == 0:
		lives += 1
		EventBus.emit_signal("lives_changed")


func _on_player_killed() -> void:
	lives -= 1
	if lives <= 0:
		set_player(null)
		EventBus.emit_signal("game_over")
	else:
		EventBus.emit_signal("lives_changed")
		EventBus.emit_signal("respawn_player")


func set_player(player:BaseCreature) -> void:
	_player = player


func get_player() -> BaseCreature:
	return _player


func set_hallway_manager(hm:HallwayManager) -> void:
	_hallway_manager = hm


func get_hallway_manager() -> HallwayManager:
	return _hallway_manager


func _on_game_start() -> void:
	# Instace hallway manager
	score = 0
	lives = 3
	get_tree().change_scene("res://Scenes/AAA_Primary/HallwayManager/HallwayManager.tscn")
	


func _on_hall_completed(_hall) -> void:
	in_hall_transition = true


func _on_hall_start() -> void:
	in_hall_transition = false


func _on_game_over() -> void:
	game_over = true
