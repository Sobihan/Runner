extends RichTextLabel

func _ready():
	Signals.connect("updateScore", self, "updateScore")

func updateScore(score):
	self.text = String(score)
