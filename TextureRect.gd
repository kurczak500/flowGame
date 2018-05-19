extends TextureRect

var STONOGA_BACK = []

func _ready():
	LoadAllResources()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

var files = ["stonog_tlo.jpg", "stonoga1.jpg", "stonoga2.jpg", "stonoga3.jpg", "stonoga4.jpg", "stonoga5.jpg", "stonoga6.jpg"]

func LoadAllResources():
	for file in files:
		var imgFile = file
		var img = Image.new()
		var itex = ImageTexture.new()
		img.load(imgFile)
		itex.create_from_image(img)
		STONOGA_BACK.append(itex)
		
func CheckBackground(life):
	if(life >= 12 && texture != STONOGA_BACK[0]):
		texture = STONOGA_BACK[0]
	elif(life <= 11 && life >= 10 && texture != STONOGA_BACK[1]):
		texture = STONOGA_BACK[1]
	elif(life <= 9 && life >= 8 && texture != STONOGA_BACK[2]):
		texture = STONOGA_BACK[2]
	elif(life <= 7 && life >= 6 && texture != STONOGA_BACK[3]):
		texture = STONOGA_BACK[3]
	elif(life <= 5 && life >= 4 && texture != STONOGA_BACK[4]):
		texture = STONOGA_BACK[4]
	elif(life <= 3 && life >= 2 && texture != STONOGA_BACK[5]):
		texture = STONOGA_BACK[5]
	elif(life <= 1 && texture != STONOGA_BACK[6]):
		texture = STONOGA_BACK[6]
		