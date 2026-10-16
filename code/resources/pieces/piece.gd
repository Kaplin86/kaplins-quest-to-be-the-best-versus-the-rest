extends Resource
class_name Piece
## A board-piece. Meant to be overwritten.


## The ingame name
@export var DisplayName = "Basic Piece"

## The ingame description
@export_multiline() var Description := "Nothing special, Nothing terrible"

## A boolean to determine if it can overwrite
@export var Overwriting = false

## A boolean to determine if it can be overwritten
@export var Overwritable = true

@export_group("Runtime")

## The team the piece is on
@export var Team : int = 1

## Called when the piece is placed
func on_place(): pass

## A function that returns if an overwrite attempt is successful or not. For example, this would be overwritten for things that only have a percent to overwrite.
func attemptOverwrite(target : Piece) -> bool:
	if Overwriting and target.Overwritable: return true
	return false
