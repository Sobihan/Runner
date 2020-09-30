extends Control


func _ready():
	Signals.connect("killPlayer", self, "gameOver")


func _on_Button_pressed():
	get_tree().reload_current_scene()

func gameOver():
	self.show()
