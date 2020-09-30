extends "ScrollMovement.gd"

func _physics_process(delta):
	move()


func _on_EffectDamage_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("killPlayer")
		print("Touch Barrel")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
