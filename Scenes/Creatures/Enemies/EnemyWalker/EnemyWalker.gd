extends BaseCreature


func _ready() -> void:
	velocity.x = Move_Speed


func _physics_process(delta):
	if $RayRight.is_colliding() || $RayLeft.is_colliding():
		velocity.x = -velocity.x
	$Weapon.fire()


func _on_Health_killed() -> void:
	._on_Health_killed()
	call_deferred("queue_free")
