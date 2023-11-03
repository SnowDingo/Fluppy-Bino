extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
func _physics_process(delta):
	if Global.gameover:
		show()

