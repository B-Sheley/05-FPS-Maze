extends Node

var menu = null
var key1 = false
var key2 = false
var key3 = false
var lives = 15
var keys = 0
var end = false

func _ready():
	pause_mode = PAUSE_MODE_PROCESS

func _physics_process(_delta):
	if lives <= 0 and end == false:
		end = true
		get_tree().change_scene("res://UI/Lose.tscn")
	
func _unhandled_input(_event):
	if Input.is_action_just_pressed("menu"):
		if menu == null:
			menu = get_node_or_null("/root/Game/UI/Menu")
		if menu != null:
			if not menu.visible:
				get_tree().paused = true
				menu.show()
			else:
				get_tree().paused = false
				menu.hide()
				

func reset():
	Global.key1 = false
	Global.key2 = false
	Global.key3 = false
	Global.lives = 15
	Global.keys = 0
	end = false
