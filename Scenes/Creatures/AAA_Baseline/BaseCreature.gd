class_name BaseCreature
extends KinematicBody

export(float) var Move_Speed
export(bool) var Apply_Gravity := true
export(PackedScene) var Spawn_On_Killed : PackedScene

var grounded := false
var velocity : Vector3



func _physics_process(delta):
	apply_gravity()
	move_creature()


func apply_gravity() -> void:
	if Apply_Gravity && !grounded:
		velocity += GameManager.gravity


func move_creature() -> void:
	if grounded || is_on_ceiling():
		velocity.y = 0
	move_and_slide(velocity, Vector3.UP)
	if is_on_floor():
		grounded = true


func _on_Health_damaged():
	pass # Replace with function body.


func _on_Health_killed():
	print("%s killed" % self.name)
	if Spawn_On_Killed:
		var s = Spawn_On_Killed.instance()
		get_parent().add_child(s)
		s.global_transform = global_transform

