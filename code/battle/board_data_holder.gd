extends Node
class_name BoardDataHolderNode


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

func getPiece(location : Vector2i,miniboard : Vector2i) -> Piece:
	if BoardPositionToMiniboard.has(miniboard):
		return BoardPositionToMiniboard[miniboard].Pieces.get(location,null)
	else:
		return null

func setPiece(location : Vector2i,miniboard : Vector2i, PieceToPlace : Piece):
	BoardPositionToMiniboard[miniboard].Pieces[location] = PieceToPlace
