extends Node2D

export (Array, PackedScene) var scenes #On crée 1 variable dans l'inspecteur et on l'utilise ici en Array

var randomScene = RandomNumberGenerator.new()
var SceneIndex = 0


func _on_Timer_timeout():
	randomScene.randomize()
	SceneIndex = randomScene.randl_range(0, scenes.size() - 1)
	var tmp = scenes[SceneIndex].instance()
	add_child_below_node(self, tmp)
