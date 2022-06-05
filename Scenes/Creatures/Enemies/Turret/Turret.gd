extends MeshInstance

export(float) var Rot_Speed := 1.0
export(NodePath) var Hallway_Path : NodePath

var is_active := false

func _ready() -> void:
	EventBus.connect("hall_start", self, "_on_hall_start")


func _on_hall_start() -> void:
	is_active = true

func _physics_process(delta) -> void:
	if !is_active:
		return
	$Weapon.fire()
	rotate_y(deg2rad(Rot_Speed))
