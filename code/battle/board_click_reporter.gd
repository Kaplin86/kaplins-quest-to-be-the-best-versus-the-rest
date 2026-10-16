extends Node2D
class_name BoardClickReporter

@export var gameplayhandler : GameplayHandlerNode
@export var renderer : BoardRendererNode

@export var MiddleMostBoard : Area2D
@export var TopLeftBoard : Area2D
@export var TopMiddleBoard : Area2D
@export var TopRightBoard : Area2D
@export var MiddleRightBoard : Area2D
@export var BottomRightBoard : Area2D
@export var BottomMiddleBoard : Area2D
@export var BottomLeftBoard : Area2D
@export var MiddleLeftBoard : Area2D

@export_category("seperator for the miniboard ones")


@export var MiddleMostBoard_MINI : Area2D
@export var TopLeftBoard_MINI : Area2D
@export var TopMiddleBoard_MINI : Area2D
@export var TopRightBoard_MINI : Area2D
@export var MiddleRightBoard_MINI : Area2D
@export var BottomRightBoard_MINI : Area2D
@export var BottomMiddleBoard_MINI : Area2D
@export var BottomLeftBoard_MINI : Area2D
@export var MiddleLeftBoard_MINI : Area2D

@export var MiniboardslotHolder : Node2D

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

@onready var MINIBoardPositionToBoardNode : Dictionary[Vector2i,Area2D] = { #Refers to a mini board on the big board
	Vector2i.ZERO: MiddleMostBoard_MINI,
	Vector2i(-1,-1): TopLeftBoard_MINI,
	Vector2i(0,-1): TopMiddleBoard_MINI,
	Vector2i(1,-1): TopRightBoard_MINI,
	Vector2i(1,0): MiddleRightBoard_MINI,
	Vector2i(1,1): BottomRightBoard_MINI,
	Vector2i(0,1): BottomMiddleBoard_MINI,
	Vector2i(-1,1): BottomLeftBoard_MINI,
	Vector2i(-1,0): MiddleLeftBoard_MINI
}


signal ClickedMiniBoard(which : Vector2i)
signal ClickedMiniboardSlot(which : Vector2i)

var lastStartPress = null

func _ready():
	for I in BoardPositionToBoardNode:
		var val : Area2D = BoardPositionToBoardNode[I]
		val.input_event.connect(inputOnArea.bind(I))
	for I in MINIBoardPositionToBoardNode:
		var val : Area2D = MINIBoardPositionToBoardNode[I]
		val.input_event.connect(inputOnSmallArea.bind(I))

func inputOnArea(viewport : Viewport, event : InputEvent, shape_idx : int, pos : Vector2i):
	if event is InputEventMouseButton:
		if event.pressed == true:
			lastStartPress = pos
		elif lastStartPress == pos:
			ClickedMiniBoard.emit(pos)
			print("big slot ", pos)

func inputOnSmallArea(viewport : Viewport, event : InputEvent, shape_idx : int, pos : Vector2i):
	if event is InputEventMouseButton:
		if event.pressed == true:
			lastStartPress = pos
		elif lastStartPress == pos:
			ClickedMiniboardSlot.emit(pos)
			

func _process(delta):
	for I : Area2D in BoardPositionToBoardNode.values():
		I.get_child(0).disabled = false
	if gameplayhandler.currentFocusedMini == null or gameplayhandler.currentFocusedMini == Vector2i(-9,-9):
		MiniboardslotHolder.global_position = Vector2i.ONE * 999999
	else:
		BoardPositionToBoardNode[gameplayhandler.currentFocusedMini].get_child(0).disabled = true
		MiniboardslotHolder.global_position = renderer.BoardPositionToBoardNode[gameplayhandler.currentFocusedMini].global_position
