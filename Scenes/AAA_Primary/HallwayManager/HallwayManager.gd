class_name HallwayManager
extends Spatial


export(NodePath) var Spawn_Point : NodePath
export(PackedScene) var PlayerScene : PackedScene
export(float) var Hall_Transition_Speed := 2.0
export(Array,PackedScene) var Hallway_Tiles : Array

var _spawn_point : Spatial
var _active_hallway : Hallway setget set_active_hallway,get_active_hallway
var _next_hallway : Hallway setget set_next_hallway,get_next_hallway
var _completed_hallway : Hallway setget set_completed_hallway,get_completed_hallway

var _transitioning := false


func _ready() -> void:
	GameManager.set_hallway_manager(self)
	_spawn_point = get_node(Spawn_Point) as Spatial
	EventBus.connect("hall_completed", self, "_on_hall_completed")
	EventBus.connect("hall_transtion_start", self, "_on_hall_transition_start")
	EventBus.connect("respawn_player", self, "_spawn_player")
	# Select/instance first and second hall tiles
	var first = _instance_random_hallway()
	set_active_hallway(first)
	_spawn_player()


func _physics_process(delta) -> void:
	if _transitioning:
		_process_hall_transition(delta)


func _spawn_player() -> void:
	var p = PlayerScene.instance()
	add_child(p)
	p.global_transform = _spawn_point.global_transform


func _on_hall_completed() -> void:
	set_next_hallway(_instance_random_hallway())


func _instance_random_hallway() -> Hallway:
	var h = Hallway_Tiles[randi() % Hallway_Tiles.size()].instance()
	$Hallways.add_child(h)
	return h


func add_bullet(bullet:BaseCreature) -> void:
	get_active_hallway().add_creature(bullet)


func add_enemy(enemy:BaseCreature) -> void:
	get_active_hallway().add_creature(enemy)


func get_active_hallway() -> Hallway:
	return _active_hallway


func set_active_hallway(hallway:Hallway) -> void:
	_active_hallway = hallway
	EventBus.emit_signal("hall_active", _active_hallway)


func get_next_hallway() -> Hallway:
	return _next_hallway


func set_next_hallway(hallway:Hallway) -> void:
	_next_hallway = hallway
	_next_hallway.global_transform = get_active_hallway().get_next_hall_connector()


func get_completed_hallway() -> Hallway:
	return _completed_hallway


func set_completed_hallway(hallway:Hallway) -> void:
	_completed_hallway = hallway


func _on_hall_transition_start() -> void:
	_completed_hallway = get_active_hallway()
	set_active_hallway(_next_hallway)
	_transitioning = true


func _process_hall_transition(delta) -> void:
	for child in $Hallways.get_children():
		child.translate(Vector3.BACK * delta * Hall_Transition_Speed)
	if get_active_hallway().global_transform.origin.z >= 0:
		EventBus.emit_signal("hall_transiton_end")
		_transitioning = false
		get_completed_hallway().queue_free()
