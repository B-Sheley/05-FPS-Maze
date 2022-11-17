extends ColorRect


func _ready():
	pass

func _physics_process(_delta):
	$Label.text = "Lives: " + str(Global.lives)
	$Label2.text = "Keys Collected: " + str(Global.keys)
