extends Node2D
class_name BoardClickReporter

@export var MiddleMostBoard : Area2D
@export var TopLeftBoard : Area2D
@export var TopMiddleBoard : Area2D
@export var TopRightBoard : Area2D
@export var MiddleRightBoard : Area2D
@export var BottomRightBoard : Area2D
@export var BottomMiddleBoard : Area2D
@export var BottomLeftBoard : Area2D
@export var MiddleLeftBoard : Area2D


@onready var BoardPositionToBoardNode : Dictionary[Vector2i,Area2D] = { #Refers to a mini board on the big board
	Vector2i.ZERO: MiddleMostBoard,
	Vector2i(-1,-1): TopLeftBoard,
	Vector2i(0,-1): TopMiddleBoard,
	Vector2i(1,-1): TopRightBoard,
	Vector2i(1,0): MiddleRightBoard,
	Vector2i(1,1): BottomRightBoard,
	Vector2i(0,1): BottomMiddleBoard,
	Vector2i(-1,1): BottomLeftBoard,
	Vector2i(-1,0): MiddleLeftBoard
}

signal ClickedMiniBoard(which : Vector2i)

var lastStartPress = null

func _ready():
	for I in BoardPositionToBoardNode:
		var val : Area2D = BoardPositionToBoardNode[I]
		val.input_event.connect(inputOnArea.bind(I))

func inputOnArea(viewport : Viewport, event : InputEvent, shape_idx : int, pos : Vector2i):
	if event is InputEventMouseButton:
		if event.pressed == true:
			lastStartPress = pos
		elif lastStartPress == pos:
			ClickedMiniBoard.emit(pos)
