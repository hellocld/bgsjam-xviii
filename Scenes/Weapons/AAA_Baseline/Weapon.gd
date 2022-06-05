class_name Weapon
extends Position3D

export(PackedScene) var Bullet : PackedScene
export(AudioStreamSample) var SFX
export(float) var Cooldown := 1.0

var cooldown : Timer
var fire_player : AudioStreamPlayer3D

func _ready() -> void:
	cooldown = $Cooldown
	fire_player = $FirePlayer


func fire() -> void:
	if !cooldown.is_stopped():
		return
	var b = Bullet.instance() as BaseCreature
	GameManager.get_hallway_manager().add_bullet(b)
	b.global_transform = global_transform
	if SFX:
		fire_player.stream = SFX
		fire_player.play(0)
	cooldown.start(Cooldown)
