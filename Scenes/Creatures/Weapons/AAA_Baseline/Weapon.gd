class_name Weapon
extends Position3D

export(PackedScene) var Bullet : PackedScene

var cooldown : Timer


func _ready() -> void:
	cooldown = $Cooldown


func fire() -> void:
	if !cooldown.is_stopped():
		return
	var b = Bullet.instance() as Spatial
	get_tree().get_root().add_child(b)
	b.global_transform = global_transform
	cooldown.start()
