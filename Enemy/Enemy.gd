extends StaticBody
onready var ray = $RayCast
var red_light = false
var green_light = false
var time_run = false
var num = RandomNumberGenerator.new()
var timenum = RandomNumberGenerator.new()
var collide_once = true

func _ready():
	num.randomize()
	var random = num.randi_range(1,10)
	if random >= 6:
		green_light = true
	if random <= 5:
		red_light = true
	timenum.randomize()
	var timerandom = timenum.randi_range(2,4)
	$Timer.wait_time = timerandom


func _process(_delta):
	if $RayCast.is_colliding() and collide_once == true:
		Global.lives -= 1
		collide_once = false
	if $RayCast2.is_colliding() and collide_once == true:
		Global.lives -= 1
		collide_once = false



func _on_Timer_timeout():
	if red_light == true and time_run == false:
		$SpotLight.light_color = Color(.24,.89,.19,1)
		$SpotLight2.light_color = Color(.24,.89,.19,1)
		$RayCast.enabled = false
		$RayCast2.enabled = false
		collide_once = false
		red_light = false
		green_light = true
		time_run = true
	if green_light == true and time_run == false:
		$SpotLight.light_color = Color(.94,.01,.01,1)
		$SpotLight2.light_color = Color(.94,.01,.01,1)
		$RayCast.enabled = true
		$RayCast2.enabled = true
		collide_once = true
		red_light = true
		green_light = false
		time_run = true
	time_run = false
	$Timer.start()
	


func _on_Area_body_entered(body):
	if body.name == "Player":
		Global.lives -= 3
