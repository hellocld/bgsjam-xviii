extends BaseCreature

export(float) var Jump_Force := 10
export(NodePath) var Weapon_Path

var weapon : Weapon

func _ready() -> void:
	if Weapon_Path:
		weapon = get_node(Weapon_Path)


func _physics_process(_delta) -> void:
	_handle_move_input()
	if Input.is_action_pressed("gm_shoot") && weapon:
		weapon.fire()


func _handle_move_input() -> void:
	velocity.x = 0
	if Input.is_action_pressed("gm_move_left"):
		velocity.x = -Move_Speed
	if Input.is_action_pressed("gm_move_right"):
		velocity.x = Move_Speed
	if Input.is_action_just_pressed("gm_jump") && grounded:
		velocity.y += Jump_Force
		grounded = false




func _on_Health_killed() -> void:
	print("DEAD")
	queue_free()


func _on_Health_damaged() -> void:
	print("OUCH")
