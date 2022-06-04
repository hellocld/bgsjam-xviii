extends BaseCreature


func _physics_process(delta):
	velocity = -global_transform.basis.z * Move_Speed


func _on_Health_killed() -> void:
	queue_free()
