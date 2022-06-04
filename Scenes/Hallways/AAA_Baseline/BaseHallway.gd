class_name Hallway
extends Spatial


func get_next_hall_connector() -> Transform:
	return $NextHallConnector.global_transform


func hall_ready_to_transition() -> void:
	EventBus.emit_signal("hall_transtion_start")
