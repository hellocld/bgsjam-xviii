extends AudioStreamPlayer3D




func _on_BulletDeath_finished():
	queue_free()
