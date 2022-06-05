extends MeshInstance


var mat

func _ready() -> void:
	mat = mesh.surface_get_material(0) as SpatialMaterial

func _on_Health_damaged():
	pass # Replace with function body.
