extends BaseCreature

export(float) var Spawn_I_Time := 3.0
export(float) var Jump_Force := 10
export(NodePath) var Weapon_Path

var weapon : Weapon

func _ready() -> void:
	GameManager.set_player($PlayerCenter)
	if Weapon_Path:
		weapon = get_node(Weapon_Path)
	call_deferred("_spawn_invulnerable")


func _spawn_invulnerable() -> void:
	var invuln_timer = get_tree().create_timer(3.0)
	invuln_timer.connect("timeout", self, "_on_invuln_timeout")
	$Health.set_invulnerable(true)

func _physics_process(_delta) -> void:
	if !GameManager.in_hall_transition:
		_handle_player_input()
	else:
		velocity.x = 0



func _handle_player_input() -> void:
	velocity.x = 0
	if Input.is_action_pressed("gm_move_left"):
		velocity.x = -Move_Speed
	if Input.is_action_pressed("gm_move_right"):
		velocity.x = Move_Speed
	if Input.is_action_just_pressed("gm_jump") && grounded:
		velocity.y += Jump_Force
		grounded = false
	if Input.is_action_pressed("gm_shoot") && weapon:
		weapon.fire()


func _on_Health_killed() -> void:
	EventBus.emit_signal("player_killed")
	._on_Health_killed()


func _on_invuln_timeout() -> void:
	$Health.set_invulnerable(false)
