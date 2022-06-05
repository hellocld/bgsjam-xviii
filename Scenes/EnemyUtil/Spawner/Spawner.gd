extends Position3D


export(PackedScene) var Enemy : PackedScene
export(int) var Max_Spawns
export(NodePath) var HallwayOwner

var spawns = 0
var can_spawn := true

func _ready() -> void:
	EventBus.connect("hall_start", self, "_on_hall_start")
	EventBus.connect("hall_completed", self, "_on_hall_completed")


func _on_hall_start() -> void:
	$SpawnDelay.start()
	_spawn_creature()


func _on_hall_completed(hall) -> void:
	var owner = get_node(HallwayOwner)
	if owner == hall:
		can_spawn = false


func _spawn_creature() -> void:
	if !can_spawn:
		return
	var e = Enemy.instance() as BaseCreature
	GameManager.get_hallway_manager().get_active_hallway().add_creature(e)
	e.connect("creature_killed", self, "_on_spawned_creature_killed")
	e.global_transform = global_transform
	spawns += 1


func _on_SpawnDelay_timeout():
	if spawns > Max_Spawns:
		return
	_spawn_creature()

func _on_spawned_creature_killed() -> void:
	spawns -= 1
