extends Node

var VP = Vector2.ZERO #represents the lower-right corner of the viewpoint

var score = 0
var time = 100
var lives = 5

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")

func _resize():
	VP = get_viewport().size

#func _unhandled_input(event):
#	if event.is_action_pressed("menu"):
#		get_tree().quit()

func _reset():
	get_tree().paused = false
	score = 0
	time = 100
	lives = 5

func update_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()

func update_lives(l):
	lives += l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_lives()

func update_time(t):
	time += t
	if time <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_time()
