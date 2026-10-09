@tool
extends Node

# Kaplin Pieces
var Torsos : Array[PackedScene] = []
var TorsoCount := 4
const _TorsoPath := "res://scenes/kaplinGeneration/torsos/torso"
var Heads : Array[PackedScene] = []
var HeadCount := 3
const _HeadPath := "res://scenes/kaplinGeneration/heads/head"
var Fins : Array[PackedScene] = []
var FinCount := 2
const _FinPath := "res://scenes/kaplinGeneration/fins/fins"
var Faces : Array[PackedScene] = []
var FaceCount := 4
const _FacePath := "res://scenes/kaplinGeneration/faces/faces"
var Hats : Array[PackedScene] = []
var HatCount := 4
const _HatPath := "res://scenes/kaplinGeneration/hats/hat"

func _init():
	loadGenerationScenes(_TorsoPath, TorsoCount, Torsos)
	loadGenerationScenes(_HeadPath, HeadCount, Heads)
	loadGenerationScenes(_FinPath, FinCount, Fins)
	loadGenerationScenes(_FacePath, FaceCount, Faces)
	loadGenerationScenes(_HatPath, HatCount, Hats)

func loadGenerationScenes(loadingString : String, count : int, resultingArray : Array):
	resultingArray.clear()
	for I in count:
		var loaded = load(loadingString+str(I)+".tscn")
		if loaded != null:
			resultingArray.append(loaded)
