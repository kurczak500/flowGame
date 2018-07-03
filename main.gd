extends Node

export (PackedScene) var Mob
export (PackedScene) var Raindrop

var gameOver = false

var score = 0

func _ready():
	randomize() #random seed
	pass

func _process(delta):
	pass

func gameOver():
	gameOver = true
	killAll()
	get_node("MobTimer").stop()
	get_node("WaterTimer").stop()
	get_node("Label").hide()
	get_node("EndGameLabel").bbcode_text = "[center]Your score:[/center]\n [center]" + str(score) + "[/center]\n [center]Press enter to restart[/center]"
	get_node("EndGameLabel").show()
	
func killAll():
	for item in self.get_children():
		var name = item.get_name()
		if("Raindrop" in name || "Astero" in name):
			item.queue_free()		

func restartGame():
	gameOver = false
	score = 0
	get_node("MobTimer").start()
	get_node("WaterTimer").start()
	get_node("EndGameLabel").hide()
	get_node("Label").text = "Score: 0"
	get_node("Label").show()
	get_node("Player")._ready()

func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	mob.set_position($MobPath/MobSpawnLocation.position)
	
	var direction = ($MobPath/MobSpawnLocation.rotation+ PI/2)
	direction += rand_range(-PI/4,PI/4)
	mob.set_rotation(direction)
	
	mob.set_linear_velocity(Vector2(rand_range(150,250),0). rotated(direction))
	score += 1
	$Label.text = "SCORE: " + str(score)

func _on_WaterTimer_timeout():
	$WaterPath/WaterSpawLocation.set_offset(randi())
	var water = Raindrop.instance()
	add_child(water)
	water.set_position($WaterPath/WaterSpawLocation.position)
	
	var direction = ($WaterPath/WaterSpawLocation.rotation)
	water.set_rotation(direction)
	
	water.set_linear_velocity(Vector2(30,0).rotated(direction))