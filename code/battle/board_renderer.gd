extends CanvasGroup
class_name BoardRendererNode

@export var individualBoardZoom = 2.66
@export var individualOffset := Vector2(0,5)

@export var fullBoardZoom = 0.705
@export var fullOffset := Vector2(0,55.135)

@export var ControlCamera : Camera2D

@export var BigBoard : Node2D
@export var MiddleMostBoard : Node2D
@export var TopLeftBoard : Node2D
@export var TopMiddleBoard : Node2D
@export var TopRightBoard : Node2D
@export var MiddleRightBoard : Node2D
@export var BottomRightBoard : Node2D
@export var BottomMiddleBoard : Node2D
@export var BottomLeftBoard : Node2D
@export var MiddleLeftBoard : Node2D

var wantedCameraPos : Vector2 = Vector2.ZERO
var wantedCameraOffset := individualOffset
var wantedZoom := Vector2.ONE

@onready var BoardPositionToBoardNode : Dictionary[Vector2i,Node2D] = { #Refers to a mini board on the big board
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

var PiecePositionOffset : Dictionary[Vector2i,Vector2] = { #Refers to the positional offset from the center of a mini-board
	Vector2i.ZERO: Vector2.ZERO,
	Vector2i(-1,-1): Vector2(-74,-74),
	Vector2i(0,-1): Vector2(0,-74),
	Vector2i(1,-1): Vector2(74,-74),
	Vector2i(1,0): Vector2(82,8),
	Vector2i(1,1): Vector2(78,90),
	Vector2i(0,1): Vector2(0,90),
	Vector2i(-1,1): Vector2(-87,90),
	Vector2i(-1,0): Vector2(-82,8)
}

func getGlobalPosFromMiniBoardPos(Miniboard : Vector2i,MiniboardPlacement : Vector2i) -> Vector2: #if you wanted to get, lets say, the bottom left slot on the top middle miniboard, you would input Vector2i(0,-1), Vector2i(-1,1)
	if BoardPositionToBoardNode.has(Miniboard):
		var basePos = BoardPositionToBoardNode[Miniboard].global_position
		var finalPos = basePos + PiecePositionOffset.get(MiniboardPlacement,Vector2.ZERO)
		return finalPos
	return Vector2.ZERO

func focusOnMiniboard(Miniboard : Vector2i):
	if BoardPositionToBoardNode.has(Miniboard):
		wantedCameraPos = BoardPositionToBoardNode[Miniboard].global_position
		wantedZoom = Vector2.ONE * individualBoardZoom
		wantedCameraOffset = individualOffset

func focusOnGlobal():
	wantedCameraPos = BoardPositionToBoardNode[Vector2i.ZERO].global_position
	wantedZoom = Vector2.ONE * fullBoardZoom
	wantedCameraOffset = fullOffset

func _process(delta: float) -> void:
	ControlCamera.zoom = lerp(ControlCamera.zoom,wantedZoom,delta*5)
	ControlCamera.global_position = lerp(ControlCamera.global_position,wantedCameraPos,delta*5)
	ControlCamera.offset = lerp(ControlCamera.offset,wantedCameraOffset,delta*5)
