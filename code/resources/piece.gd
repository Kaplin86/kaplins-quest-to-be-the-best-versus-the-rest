extends Resource
class_name Piece
## A board-piece. Meant to be overwritten.

## The team the piece is on
@export var Team : int = 1

## Called when the piece is placed
func on_place(): pass
