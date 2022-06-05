extends Spatial


func _physics_process(_delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		EventBus.emit_signal("game_start")
