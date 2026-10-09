@tool
extends Node2D
class_name KaplinVisual

@export var torso := 0:
	set(new_value):
		torso = new_value 
		_generate() 
@export var head := 0:
	set(new_value):
		head = new_value 
		_generate() 
@export var fin := 0:
	set(new_value):
		fin = new_value 
		_generate() 
@export var face := 0:
	set(new_value):
		face = new_value 
		_generate() 
@export var hat := 0:
	set(new_value):
		hat = new_value 
		_generate() 

var currentTorso : TorsoPiece
var currentHead : HeadPiece
var currentFin : FinsPiece
var currentFace : FacePiece
var currentHat : HatPiece

func _generate():
	if Engine.is_editor_hint():
		Ref._init()
	
	
	for I in [currentTorso,currentHead,currentFin, currentFace,currentHat]:
		if I: I.queue_free()
	
	currentTorso = Ref.Torsos[torso].instantiate()
	add_child(currentTorso)
	currentFin = Ref.Fins[fin].instantiate()
	add_child(currentFin)
	currentHead = Ref.Heads[head].instantiate()
	add_child(currentHead)
	currentFace = Ref.Faces[face].instantiate()
	add_child(currentFace)
	currentHat = Ref.Hats[hat].instantiate()
	add_child(currentHat)
	
	currentHead.global_position = currentTorso.getHeadPos() - currentHead.getAttachPos()
	currentFin.global_position = currentHead.getFinPos()
	currentFace.global_position = currentHead.global_position
	currentHat.global_position = currentHead.getFinPos()
	
func _ready():
	_generate()
