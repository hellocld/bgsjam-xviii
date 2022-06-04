extends BaseCreature



func _ready():
	velocity = Vector3.FORWARD * Move_Speed


func _on_Health_killed() -> void:
	queue_free()
