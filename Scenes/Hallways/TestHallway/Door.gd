extends Spatial

signal door_open()


func _on_door_is_opened() -> void:
	emit_signal("door_open")


func _on_HallCompleteSwitch_switch_destroyed():
	$AnimationPlayer.play("OpenDoor")
