extends Node2D

onready var animation = $PlayerAnimatedSprite

func _ready():
	animation.play("run");
