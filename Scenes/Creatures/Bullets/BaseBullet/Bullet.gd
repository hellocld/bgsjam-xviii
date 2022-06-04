extends BaseCreature



func _physics_process(delta) -> void:
	 move_and_slide(Vector3.FORWARD * Move_Speed, Vector3.UP)
