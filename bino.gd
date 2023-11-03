extends CharacterBody2D

@export var JUMP_VELOCITY = -400.0
const GRAVITY_POWER := 1000
# Get the gravity from the project settings to be synced with RigidBody nodes.
var canjump = true
@onready var sprite = $Bino
signal gameover 
func _ready():
	canjump = true
	velocity = Vector2.ZERO
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY_POWER * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and canjump:
		velocity.y = clamp(JUMP_VELOCITY,-160,638)
	if position.y < 0:
	# 画面上にはみ出さないようにする
		velocity.y = 100
	if position.y > 197:
		velocity.y = JUMP_VELOCITY

	var collision = move_and_collide(velocity * delta)
	if collision:
		canjump = false
		emit_signal("gameover")
		velocity.x  -=300
		move_and_collide(velocity * delta)
		
		
