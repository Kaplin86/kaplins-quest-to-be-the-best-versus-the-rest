extends CanvasLayer
class_name HandPieceSelectorNode

## A node that tracks and processes selecting pieces from hand, including rendering

## The current pieces in hand
@export var hand : Array[Piece] = []

@export var destinationHbox : HBoxContainer

var pieceScene = preload("res://scenes/battle/piecehandbutton.tscn")

var currentSelectedPieceID = -1

func render():
	for I in destinationHbox.get_children(): I.queue_free()
	var num = 0
	for I in hand:
		var newButton : Button = pieceScene.instantiate()
		destinationHbox.add_child(newButton)
		newButton.icon = I.IconX
		newButton.pressed.connect(onPress.bind(num,newButton))
		num += 1

func onPress(num : int, button : Button): # num refers to the index of the hand piece clicked
	for I in destinationHbox.get_children(): I.modulate = Color.WHITE
	if currentSelectedPieceID != num:
		button.modulate = Color(0.455, 0.455, 0.455, 1.0)
		currentSelectedPieceID = num
	else:
		currentSelectedPieceID = -1
	
	print("h")

func _ready():
	render()

func _process(delta):
	var num = -1
	for I : Button in destinationHbox.get_children():
		num += 1
		if num == currentSelectedPieceID:
			I.offset_transform_position = lerp(I.offset_transform_position,Vector2(0,-30),delta * 20)
		else:
			I.offset_transform_position = lerp(I.offset_transform_position,Vector2(0,0),delta * 20)

func getSelectedPiece() -> Piece:
	return hand[currentSelectedPieceID]
