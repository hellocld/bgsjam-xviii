extends BaseCreature


func _on_Health_killed() -> void:
	._on_Health_killed()
	call_deferred("queue_free")
