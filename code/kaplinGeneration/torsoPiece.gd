@tool
@icon("res://assets/editor/torsoPiece.png")
extends Node2D
class_name TorsoPiece

## A node that is the torso part of the kaplin character

## The node that refers to the location the head is
@export var HeadJoint : Node2D

## Returns whether this part is 'valid' (i.e. all parts have definitions)
func isValid() -> bool:
	if is_instance_valid(HeadJoint):
		return true
	return false

## A function that immediately gets the global head position. Functionally the same as This.HeadJoint.Global_Position
func getHeadPos() -> Vector2:
	if isValid():
		return HeadJoint.global_position
	else:
		return Vector2.ZERO
