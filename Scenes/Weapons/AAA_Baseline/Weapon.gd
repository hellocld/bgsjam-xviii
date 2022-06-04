class_name Weapon
extends Position3D

export(PackedScene) var Bullet : PackedScene
export(float) var Cooldown := 1.0

var cooldown : Timer


func _ready() -> void:
	cooldown = $Cooldown


func fire() -> void:
	if !cooldown.is_stopped():
		return
	var b = Bullet.instance() as BaseCreature
	GameManager.get_hallway_manager().add_bullet(b)
	b.global_transform = global_transform
	cooldown.start(Cooldown)
