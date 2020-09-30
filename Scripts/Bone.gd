extends "ScrollMovement.gd"

func _physics_process(delta):
	move()


func _on_Pickup_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("rewardPlayer", 1)
		queue_free()
		print("Player touch the bone")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #Supprime quand le bone sort de l'écran
