extends Area2D

signal hit

export (int) var SPEED
var screensize
var velocity = Vector2()

var score = 0
var life = 13

var X_SIZE = 1280
var Y_SIZE = 720
var SPRITE_SIZE_X = 50
var SPRITE_SIZE_Y = 65

onready var scoreLabel = get_node("../ScoreLabel")
var SCORE_LABEL = "SCORE: "

onready var background = get_node("../Control/TextureRect")

var waterBars = []

func _ready():
	screensize = get_viewport_rect().size
	AddWater(13, 0.0)
	position = Vector2(640.0, 450.0)	
	life = 13
	
func AddWater(howMany, startPosition):
	startPosition = 60.0 - startPosition
	if (startPosition < -60.0):
		return
	
	if(howMany < 13):
		life += howMany
		background.CheckBackground(life)
	
	for x in range(0,howMany):
		var water = load("res://WaterInTank.tscn").instance()
		water.translate(Vector2(0.0, (startPosition - x*10.0)))
		add_child(water)
		waterBars.append(water)
		
func DropWater():
	var index = waterBars.size()
	if(index < 1):
		return
	
	remove_child(waterBars[index - 1])
	waterBars.remove(index - 1)
	
	life -= 1
	background.CheckBackground(life)
	
#	if(life < 1):
#		get_node("../../main").gameOver = true
	
func AddPoints(howMany):
	score += howMany
	scoreLabel.text = SCORE_LABEL + str(score)
	
func _physics_process(delta):
#	if(get_node("../../main").gameOver):
#		return
	
	position += velocity
	AcceptPosition()
	
func _process(delta):
#	if(get_node("../../main").gameOver):
#		return
	
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
        velocity.y += 1
	if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
	if velocity.length() > 0:
        velocity = velocity.normalized() * SPEED
		
		#testsss
#	if Input.is_action_just_released("ui_up"):
#		DropWater()
#	if Input.is_action_just_released("ui_down"):
#		AddWater(1, waterBars.size() * 10.0)

func AcceptPosition():
	if(position.x < 0 + SPRITE_SIZE_X || position.x > X_SIZE - SPRITE_SIZE_X):
		position -= velocity
	if(position.y < 0 + SPRITE_SIZE_Y || position.y > Y_SIZE - SPRITE_SIZE_Y):
		position -= velocity

func _on_Player_body_entered(body):
	if "Water" in body.get_name():
		if(body.get_position().y+50 < get_position().y):
			AddWater(1, waterBars.size() * 10.0)
			body.queue_free()
	
	elif "Astero" in body.get_name():		
		DropWater()
		body.queue_free()
