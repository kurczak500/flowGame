extends Area2D

# class member variables go here, for example:
export (int) var SPEED
var screensize
var velocity = Vector2()

var SCORE = 0
var LIFE = 100

var X_SIZE = 1280
var Y_SIZE = 720
var SPRITE_SIZE_X = 50
var SPRITE_SIZE_Y = 65

onready var scoreLabel = get_node("../ScoreLabel")
var SCORE_LABEL = "SCORE: "

onready var background = get_node("../Control/TextureRect")

func _ready():
	screensize = get_viewport_rect().size
	position = Vector2(640.0, 450.0)
	
func _physics_process(delta):
	position += velocity
	AcceptPosition()
	scoreLabel.text = SCORE_LABEL + str(SCORE)
	background.CheckBackground(LIFE)
	
func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
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

func AcceptPosition():
	if(position.x < 0 + SPRITE_SIZE_X || position.x > X_SIZE - SPRITE_SIZE_X):
		position -= velocity
	if(position.y < 0 + SPRITE_SIZE_Y || position.y > Y_SIZE - SPRITE_SIZE_Y):
		position -= velocity
		
func CheckBackground():
	if(LIFE > 89):
		pass
		