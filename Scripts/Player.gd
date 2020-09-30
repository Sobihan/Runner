extends KinematicBody2D

var velocity = Vector2.ZERO;

enum {
	JUMP,
	RUN,
	IDLE
}

var state = RUN

export var jumpVelocity = 600.0
export var gravity_scale = 20.0 #Export pour afficher dans l'inspector

onready var animation = $PlayerAnimatedSprite #Onready pour utiliser dans le code l'animation

var score = 0

func jump():
	velocity = Vector2.ZERO
	velocity.y -= jumpVelocity
	animation.play("jump")
	state = IDLE

func _physics_process(delta):
	match state: #1 sorte de Switch Case
		RUN:
			animation.play("run")
		JUMP:
			jump()
		IDLE:
			pass
	velocity.y += gravity_scale
	move_and_collide(velocity * delta)

func _input(event):
	if state == RUN and event.is_action_pressed("Jump"):
		state = JUMP

func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		state = RUN

func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		state = JUMP

func _ready():
	Signals.connect("rewardPlayer", self, "rewardPlayer")

func rewardPlayer(scoreToAdd):
	score += scoreToAdd
	print(score)
