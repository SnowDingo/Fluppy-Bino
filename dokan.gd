extends StaticBody2D

var velocity = Vector2(-150, 0)
@onready var sprite = $Sprite2D

# 開始処理
func start(pos, speed_rate):
	position = pos
	velocity *= speed_rate

func _process(delta):
	if !Global.gameover:
		sprite.rotation -= 2 * delta
		position += velocity * delta
		if position.x < -128:
			# 画面外に出たら消える
			print("Qued")
			Global.score += 1
			queue_free()
	else:
		queue_free()
