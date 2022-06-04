extends KinematicBody

export(float) var Move_Speed := 1.0
export(float) var Jump_Force := 25


var velocity : Vector3
var grounded := false

func _physics_process(delta) -> void:
	_move_player(delta)



func _move_player(delta) -> void:
	velocity.x = 0
	if grounded || is_on_ceiling():
		velocity.y = 0
	if !grounded:
		velocity += GameManager.gravity
	if Input.is_action_pressed("gm_move_left"):
		velocity.x = -Move_Speed
	if Input.is_action_pressed("gm_move_right"):
		velocity.x = Move_Speed
	if Input.is_action_just_pressed("gm_jump") && grounded:
		velocity.y += Jump_Force
		grounded = false

	move_and_slide(velocity, Vector3.UP)
	if is_on_floor():
		grounded = true

func _shoot() -> void:
	if !$GunCooldown.is_stopped():
		pass
	
