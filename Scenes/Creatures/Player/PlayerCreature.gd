extends BaseCreature

export(float) var Jump_Force := 10


func _physics_process(_delta) -> void:
	_handle_move_input()


func _handle_move_input() -> void:
	velocity.x = 0
	if Input.is_action_pressed("gm_move_left"):
		velocity.x = -Move_Speed
	if Input.is_action_pressed("gm_move_right"):
		velocity.x = Move_Speed
	if Input.is_action_just_pressed("gm_jump") && grounded:
		velocity.y += Jump_Force
		grounded = false


func _shoot() -> void:
	if !$GunCooldown.is_stopped():
		pass
	
