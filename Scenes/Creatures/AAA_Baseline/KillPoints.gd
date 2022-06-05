extends Node

export(int) var Points := 10


func _on_Health_killed():
	EventBus.emit_signal("enemy_killed", Points)
