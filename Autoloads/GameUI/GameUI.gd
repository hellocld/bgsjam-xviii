extends Control


export(NodePath) var TitleControl : NodePath
export(NodePath) var HudControl : NodePath
export(NodePath) var GameOverControl : NodePath
export(NodePath) var HowToPlayControl : NodePath

var _title : Control
var _hud : Control
var _game_over : Control
var _how_to_play : Control

func _ready() -> void:
	_title = get_node(TitleControl) as Control
	_hud = get_node(HudControl) as Control
	_game_over = get_node(GameOverControl) as Control
	_how_to_play = get_node(HowToPlayControl) as Control
	
	EventBus.connect("game_over", self, "_on_game_over")
	EventBus.connect("game_start", self, "_on_game_start")
	EventBus.connect("main_menu", self, "_on_main_menu")
	
	_on_main_menu()

func _on_main_menu() -> void:
	_hud.visible = false
	_game_over.visible = false
	_how_to_play.visible = false
	_title.visible = true


func _on_game_over() -> void:
	_hud.visible = false
	_game_over.visible = true
	_how_to_play.visible = false
	_title.visible = false


func _on_game_start() -> void:
	_hud.visible = true
	_game_over.visible = false
	_how_to_play.visible = false
	_title.visible = false
