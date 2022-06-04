extends BaseCreature

export(float) var Jump_Force := 10
export(NodePath) var Weapon_Path

var weapon : Weapon

func _ready() -> void:
	GameManager.set_player(self)
	if Weapon_Path:
		weapon = get_node(Weapon_Path)


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
	print("DEAD")
	queue_free()


func _on_Health_damaged() -> void:
	print("OUCH")
