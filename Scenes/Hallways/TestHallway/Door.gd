extends Spatial

signal door_open()


func _ready() -> void:
	EventBus.connect("hall_completed", self, "_on_hall_completed")


func _on_door_is_opened() -> void:
	emit_signal("door_open")


func _on_HallCompleteSwitch_switch_destroyed():
	$AnimationPlayer.play("OpenDoor")
