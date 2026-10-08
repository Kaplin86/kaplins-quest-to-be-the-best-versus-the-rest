@tool
@icon("res://assets/editor/torsoPiece.png")
extends Node2D
class_name FinsPiece

## A node that is the fins part of the kaplin character

## The node that refers to the location the fin will connect
@export var FinJoint : Node2D

## Returns whether this part is 'valid' (i.e. all parts have definitions)
func isValid() -> bool:
	if is_instance_valid(FinJoint):
		return true
	return false

## A function that immediately gets the global head position. Functionally the same as This.FinJoint.Global_Position
func getFinPos() -> Vector2:
	if isValid():
		return FinJoint.global_position
	else:
		return Vector2.ZERO
