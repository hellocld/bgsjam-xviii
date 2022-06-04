extends BaseCreature

signal switch_destroyed()


export(NodePath) var Hallway_Path : NodePath


func _on_Health_killed() -> void:
	emit_signal("switch_destroyed")
	EventBus.emit_signal("hall_completed")
	queue_free()
