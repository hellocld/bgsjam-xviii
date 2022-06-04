extends Node

export(NodePath) var Hallway_Path

func _ready() -> void:
	EventBus.connect("hall_transiton_end", self, "_on_hall_transition_end")


func _on_hall_transition_end() -> void:
	EventBus.emit_signal("hall_start")
