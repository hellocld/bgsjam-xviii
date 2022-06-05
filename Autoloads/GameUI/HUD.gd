extends Control


func _ready() -> void:
	$Score.text = "SCORE: %010d" % [GameManager.score]
	$Lives.text = "LIVES: %d" % [GameManager.lives]
	EventBus.connect("lives_changed", self, "_on_lives_changed")
	EventBus.connect("score_changed", self, "_on_score_changed")


func _on_score_changed() -> void:
	$Score.text = "SCORE: %010d" % [GameManager.score]


func _on_lives_changed() -> void:
	$Lives.text = "LIVES: %d" % [GameManager.lives]
