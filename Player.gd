extends Area2D

# class member variables go here, for example:
export (int) var SPEED
var screensize
var velocity = Vector2()

func _ready():
	screensize = get_viewport_rect().size
	
	
	
func _physics_process(delta):
	position += velocity
	
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

