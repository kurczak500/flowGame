extends Node

export (PackedScene) var Mob
export (PackedScene) var Water

#var gameOver = false
#
#onready var endGameLabel = get_node("EndGameLabel")
#onready var player = get_node("Player")

func _ready():
	pass


func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	if(gameOver):		
#		get_node("WaterTimer").stop()
#		get_node("MobTimer").stop()
#		endGameLabel.text = "<center>You collect " + str(player.score) + "</center>\n Please click enter to start new game"
#		endGameLabel.visible = true
#		#dodac nowa scene z info o wyniku i czy jeszcze raz
#
#
#	if (gameOver && Input.is_action_pressed("ui_accept")):	
#		endGameLabel.visible = false	
#		player.score = 0
#		player.life = 13
#		player.AddWater(13, 0.0)
#		player.position = Vector2(640.0, 450.0)
#		gameOver = false
#		get_node("WaterTimer").start()
#		get_node("MobTimer").start()	
	pass


func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	mob.set_position($MobPath/MobSpawnLocation.position)
	
	var direction = ($MobPath/MobSpawnLocation.rotation+ PI/2)
	direction += rand_range(-PI/4,PI/4)
	mob.set_rotation(direction)
	
	mob.set_linear_velocity(Vector2(rand_range(150,250),0). rotated(direction))


func _on_WaterTimer_timeout():
	$WaterPath/WaterSpawLocation.set_offset(randi())
	var water = Water.instance()
	add_child(water)
	water.set_position($WaterPath/WaterSpawLocation.position)
	
	var direction = ($WaterPath/WaterSpawLocation.rotation)
	water.set_rotation(direction)
	
	water.set_linear_velocity(Vector2(30,0).rotated(direction))


