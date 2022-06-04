extends BaseCreature


func _on_Health_killed() -> void:
	queue_free()
