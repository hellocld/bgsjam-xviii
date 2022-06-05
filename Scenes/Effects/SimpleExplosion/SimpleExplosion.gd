extends Particles

var audio_playing := true


func _ready() -> void:
	emitting = true


func _physics_process(_delta) -> void:
	if !emitting && !audio_playing:
		queue_free()


func _on_AudioStreamPlayer3D_finished():
	audio_playing = false
