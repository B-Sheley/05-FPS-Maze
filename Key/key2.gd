extends Area


func _ready():
	pass


func _on_key_body_entered(body):
	if body.name == "Player":
		Global.key2 = true
		var exit = get_node_or_null("/root/Game/Maze/Exit")
		if exit != null and Global.key1 == true and Global.key2 == true and Global.key3 == true:
			exit.unlock()
		Global.lives += 5
		Global.keys += 1
		queue_free()
			
