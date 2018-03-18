extends Node

export (PackedScene) var Tank

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event is InputEventMouseButton:
		var new_tank = Tank.instance()
		new_tank.position = get_viewport().get_mouse_position()
		add_child(new_tank)