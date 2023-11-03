extends Node2D
@onready var obsticle = preload("res://dokan.tscn")
var generatetime = randf_range(0.7,1.5)
var timer = generatetime
func _ready():
	randomize()
func _process(delta):
	if not Global.gameover:
		$CanvasLayer/ParallaxBackground.offset.x -= 0.3
		timer += delta
		$Control/score.text = str(Global.score)
		if timer > generatetime and not Global.gameover:
			timer -= generatetime
			addobstical()
func addobstical():
		# 高さを決める
	var xbase = 380
	var ybase = randi_range(0, 216)
	var scale = randf_range(1.0,2.0)
	
	var obsticles = obsticle.instantiate()
	var py = ybase

	# 土管の出現回数が増えるとスピードアップ
	var speed_rate = 1 + 0.2 * Global.score
	obsticles.start(Vector2(xbase, py), speed_rate)
	obsticles.scale = Vector2(scale,scale)
	add_child(obsticles)
	
	# インターバルを減らす
	generatetime = max(0.7, generatetime-0.1)


func _on_bino_gameover():
	Global.gameover = true
	get_tree().paused = true
	$Control/gameover.show()
	


func _on_play_pressed():
	Global.score = 0
	Global.gameover = false
	$Control/play.hide()
	$Control/gameover.hide()
	$Bino.show()
	$Bino.position = Vector2(49,48)
	$Bino.canjump = true
	$Bino.velocity = Vector2.ZERO
