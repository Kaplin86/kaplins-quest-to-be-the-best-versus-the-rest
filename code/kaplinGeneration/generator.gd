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

var currentTorso : TorsoPiece
var currentHead : HeadPiece
var currentFin : FinsPiece

func _generate():
	if Engine.is_editor_hint():
		Ref._init()
	
	
	for I in [currentTorso,currentHead,currentFin]:
		if I: I.queue_free()
	
	currentTorso = Ref.Torsos[torso].instantiate()
	add_child(currentTorso)
	currentFin = Ref.Fins[fin].instantiate()
	add_child(currentFin)
	currentHead = Ref.Heads[head].instantiate()
	add_child(currentHead)
	
	
	currentHead.global_position = currentTorso.getHeadPos() - currentHead.getAttachPos()
	currentFin.global_position = currentHead.getFinPos()
	
func _ready():
	_generate()
