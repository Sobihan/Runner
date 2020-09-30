extends Node2D

export var scrollSpeed = 6.3

func move():
	self.position.x -= scrollSpeed
