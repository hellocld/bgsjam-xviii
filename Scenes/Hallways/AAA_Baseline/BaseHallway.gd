class_name Hallway
extends Spatial


func get_next_hall_connector() -> Transform:
	return $NextHallConnector.global_transform
