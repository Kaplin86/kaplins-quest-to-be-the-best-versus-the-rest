extends Piece
class_name PercentOverwritingPiece
## A board-piece that has a percent to successfuly overwrite.

## The probability that this is a successful overwrite.
@export_range(0,1,0.05) var chance = 0.5

## A function that returns if an overwrite attempt is successful or not. Only returns true if a random value fits [member chance]
func attemptOverwrite(target : Piece) -> bool:
	if Overwriting and target.Overwritable: 
		if randf() <= chance:
			return true
	return false
