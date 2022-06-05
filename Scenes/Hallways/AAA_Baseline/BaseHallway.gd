class_name Hallway
extends Spatial


func _ready() -> void:
	EventBus.connect("hall_completed", self, "_on_hall_completed")


func add_creature(creature:BaseCreature) -> void:
	$Creatures.add_child(creature)


func get_next_hall_connector() -> Transform:
	return $NextHallConnector.global_transform


func cleanup_creatures() -> void:
	for child in $Creatures.get_children():
		for subchild in child.get_children():
			if subchild.has_method("take_damage"):
				subchild.take_damage(999999)


func hall_ready_to_transition() -> void:
	EventBus.emit_signal("hall_transtion_start")


func _on_hall_completed(hall) -> void:
	if hall == self:
		cleanup_creatures()
