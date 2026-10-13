extends Node

@export var miniboard1 : MiniBoard

func _ready():
	print(miniboard1)
	print(miniboard1.checkClaim())
