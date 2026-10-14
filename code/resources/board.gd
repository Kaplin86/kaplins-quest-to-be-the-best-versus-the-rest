extends Resource
class_name MiniBoard

## A storage resource that contains a handful of other piece resources

@export var Tags : Array[String] = [] ## An array of strings that are used to indicate any sort of statuses placed on the miniboard
@export var Claimed = -1 ##if -1, unclaimed. otherwise, its number is the team who claimed it.
@export var Pieces : Dictionary[Vector2i, Piece]= {
	Vector2i.ZERO: null,
	Vector2i(-1,-1): null,
	Vector2i(0,-1): null,
	Vector2i(1,-1): null,
	Vector2i(1,0): null,
	Vector2i(1,1): null,
	Vector2i(0,1): null,
	Vector2i(-1,1): null,
	Vector2i(-1,0): null
}

func checkClaim():
	# columns
	
	for X in range(-1,2):
		var columnPieces : Array[Piece] = []
		for Y in range(-1,2):
			columnPieces.append(Pieces.get(Vector2i(X,Y),null))
		if _allExistAndMatchTeam(columnPieces): return true
	
	# rows
	for Y in range(-1,2):
		var columnPieces : Array[Piece] = []
		for X in range(-1,2):
			columnPieces.append(Pieces.get(Vector2i(X,Y),null))
		if _allExistAndMatchTeam(columnPieces): return true
	
	var columnPieces1 : Array[Piece] = [Pieces.get(Vector2i(-1,-1)),Pieces.get(Vector2i(0,0)),Pieces.get(Vector2i(1,1))]
	var columnPieces2 : Array[Piece] = [Pieces.get(Vector2i(1,-1)),Pieces.get(Vector2i(0,0)),Pieces.get(Vector2i(-1,1))]
	if _allExistAndMatchTeam(columnPieces1): return true
	if _allExistAndMatchTeam(columnPieces2): return true
	return false

func _allExistAndMatchTeam(pieces : Array[Piece]):
	for I in pieces:
		if I == null:
			return false
	
	for I in pieces:
		if I.Team != pieces[0].Team:
			return false
	
	return true

func _to_string():
	var string = ""
	for Y in range(-1,2):
		for X in range(-1,2):
			if Pieces[Vector2i(X,Y)] == null:
				string += "?"
			else:
				string += str(Pieces[Vector2i(X,Y)].Team)
		string += "\n"
	return "MINI BOARD " + str(get_instance_id()) + ": " + "\n" + string
