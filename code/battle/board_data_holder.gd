extends Node

@export var miniboard1 : MiniBoard

var BoardPositionToMiniboard : Dictionary[Vector2i,MiniBoard] = { #Refers to the positional offset from the center of a mini-board
	Vector2i.ZERO: MiniBoard.new(),
	Vector2i(-1,-1): MiniBoard.new(),
	Vector2i(0,-1): MiniBoard.new(),
	Vector2i(1,-1): MiniBoard.new(),
	Vector2i(1,0): MiniBoard.new(),
	Vector2i(1,1): MiniBoard.new(),
	Vector2i(0,1): MiniBoard.new(),
	Vector2i(-1,1):MiniBoard.new(),
	Vector2i(-1,0): MiniBoard.new()
}

func _ready():
	#print(BoardPositionToMiniboard)
	print(miniboard1.checkClaim())
	
