extends Node

signal damaged()
signal killed()
signal invulnerable()
signal vulnerable()

export(int) var Max_Health := 3
export(bool) var Invulnerable := false setget set_invulnerable,get_invulnerable
var health : int

func _ready() -> void:
	health = Max_Health

func take_damage(damage) -> void:
	if health <= 0 || Invulnerable:
		return # no need to do the math or emit signals multiple times
	health -= damage
	if health <= 0:
		emit_signal("killed")
	else:
		emit_signal("damaged")


func set_invulnerable(var i) -> void:
	Invulnerable = i
	if i:
		emit_signal("invulnerable")
	else:
		emit_signal("vulnerable")


func get_invulnerable() -> bool:
	return Invulnerable


func _on_Hitbox_area_entered(area):
	if "Impact_Damage" in area:
		take_damage(area.Impact_Damage)


func _on_Hitbox_body_entered(body):
	if "Impact_Damage" in body:
		take_damage(body.Impact_Damage)
