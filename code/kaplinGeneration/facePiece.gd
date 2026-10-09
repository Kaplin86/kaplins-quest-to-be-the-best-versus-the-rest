@tool
@icon("res://assets/editor/torsoPiece.png")
extends Node2D
class_name FacePiece

## A node that is the face part of the kaplin character

## The node that refers to the location the fin will connect
@export var FaceJoint : Node2D

## Returns whether this part is 'valid' (i.e. all parts have definitions)
func isValid() -> bool:
	if is_instance_valid(FaceJoint):
		return true
	return false

## A function that immediately gets the global face anchor position. Functionally the same as This.FaceJoint.Global_Position
func getFinPos() -> Vector2:
	if isValid():
		return FaceJoint.global_position
	else:
		return Vector2.ZERO
