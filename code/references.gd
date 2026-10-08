@tool
extends Node

# Kaplin Pieces
var Torsos : Array[PackedScene] = []
var TorsoCount := 4
const _TorsoPath := "res://scenes/kaplinGeneration/torsos/torso"
var Heads : Array[PackedScene] = []
var HeadCount := 1
const _HeadPath := "res://scenes/kaplinGeneration/heads/head"
var Fins : Array[PackedScene] = []
var FinCount := 1
const _FinPath := "res://scenes/kaplinGeneration/fins/fins"

func _init():
	loadGenerationScenes(_TorsoPath, TorsoCount, Torsos)
	loadGenerationScenes(_HeadPath, HeadCount, Heads)
	loadGenerationScenes(_FinPath, FinCount, Fins)

func loadGenerationScenes(loadingString : String, count : int, resultingArray : Array):
	resultingArray.clear()
	for I in count:
		var loaded = load(loadingString+str(I)+".tscn")
		if loaded != null:
			resultingArray.append(loaded)
