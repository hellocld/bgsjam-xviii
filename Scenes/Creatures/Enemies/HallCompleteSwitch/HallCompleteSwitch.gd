extends BaseCreature


func _on_Health_killed() -> void:
	EventBus.emit_signal("hall_completed")
	queue_free()
