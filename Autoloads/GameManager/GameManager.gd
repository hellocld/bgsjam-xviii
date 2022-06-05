extends Node


var _player : BaseCreature setget set_player,get_player
var _hallway_manager : HallwayManager setget set_hallway_manager,get_hallway_manager
var gravity = Vector3(0, -0.4, 0)
var in_hall_transition := false


func _ready() -> void:
	EventBus.connect("hall_completed", self, "_on_hall_completed")
	EventBus.connect("hall_start", self, "_on_hall_start")
	EventBus.connect("game_start", self, "_on_game_start")


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
	get_tree().change_scene("res://Scenes/AAA_Primary/HallwayManager/HallwayManager.tscn")
	


func _on_hall_completed() -> void:
	in_hall_transition = true


func _on_hall_start() -> void:
	in_hall_transition = false
