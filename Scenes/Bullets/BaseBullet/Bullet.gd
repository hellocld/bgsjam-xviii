extends KinematicBody

export(float) var Move_Speed := 1.0


func _physics_process(delta) -> void:
	 move_and_slide(Vector3.FORWARD * Move_Speed, Vector3.UP)
