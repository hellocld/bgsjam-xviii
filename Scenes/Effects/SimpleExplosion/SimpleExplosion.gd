extends Particles


func _ready() -> void:
	emitting = true


func _physics_process(_delta) -> void:
	if !emitting:
		queue_free()
