extends KinematicBody2D

var velocity = Vector2.ZERO;
var canJump = true

export var jumpVelocity = 600.0
export var gravity_scale = 20.0 #Export pour afficher dans l'inspector

onready var animation = $PlayerAnimatedSprite

func _ready():
	animation.play("run")

func _physics_process(delta):
	velocity.y += gravity_scale
	move_and_collide(velocity * delta)

func _input(event):
	if event.is_action_pressed("Jump") and canJump == true:
		velocity = Vector2.ZERO	
		velocity.y -= jumpVelocity
		animation.play("jump")


func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		canJump = true
		print("Player in Floor")
		animation.play("run")


func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		print("Player not in Floor")
		canJump = false
