extends Position3D


func _physics_process(delta):
	var target = GameManager.get_player()
	if target != null && !GameManager.in_hall_transition:
		look_at(target.global_transform.origin, Vector3.UP)
		$Weapon.fire()
