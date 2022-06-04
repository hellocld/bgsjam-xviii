extends Node

signal damaged()
signal killed()


export(int) var Max_Health := 3
var health : int

func _ready() -> void:
	health = Max_Health

func take_damage(damage) -> void:
	health -= damage
	if health <= 0:
		emit_signal("killed")
	else:
		emit_signal("damaged")


func _on_Hitbox_area_entered(area):
	if "Impact_Damage" in area:
		take_damage(area.Impact_Damage)


func _on_Hitbox_body_entered(body):
	if "Impact_Damage" in body:
		take_damage(body.Impact_Damage)
