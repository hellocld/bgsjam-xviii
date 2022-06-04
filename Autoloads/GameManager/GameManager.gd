extends Node


var gravity = Vector3(0, -0.4, 0)
var in_hall_transition := false

func _ready() -> void:
	EventBus.connect("hall_completed", self, "_on_hall_completed")
	EventBus.connect("hall_start", self, "_on_hall_start")

func _on_hall_completed() -> void:
	in_hall_transition = true


func _on_hall_start() -> void:
	in_hall_transition = false
