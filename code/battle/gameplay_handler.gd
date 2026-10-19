extends Node
class_name GameplayHandlerNode

## The main handler node for the battle system

@export var boardClickReporter : BoardClickReporter
@export var boardRenderer : BoardRendererNode
@export var handSelector : HandPieceSelectorNode
@export var boardDataHolder : BoardDataHolderNode

## The location of the current "focused" "miniboard"
var currentFocusedMini : Vector2i = Vector2i(-9,-9)

## The current team playing this turn
var currentTeamTurn = -1

## The remaining number of actions the current turn player has
var actionsRemaining = 0

## Which team represents the player
const PLYRTEAM = 0

func _ready():
	var players = [PLYRTEAM, PLYRTEAM + 1]
	while true:
		for I in players:
			currentTeamTurn = I
			actionsRemaining = 1
			await doTurn()

func doTurn():
	if currentFocusedMini == null or currentFocusedMini == Vector2i(-9,-9):
		currentFocusedMini = await chooseMiniboard()
	boardRenderer.focusOnMiniboard(currentFocusedMini)
	while actionsRemaining != 0:
		await doMove()
		actionsRemaining -= 1
	await get_tree().create_timer(2).timeout

func doMove():
	if PLYRTEAM == currentTeamTurn:
		var chosenPlace = Vector2i(-9,-9)
		while chosenPlace == Vector2i(-9,-9):
			var move = await boardClickReporter.ClickedMiniboardSlot
			if handSelector.currentSelectedPieceID != -1:
				chosenPlace = move
		
		
		
	else:
		pass

func place(location : Vector2i, miniboard : Vector2i, piece : Piece, team : int):
	

func chooseMiniboard():
	boardRenderer.focusOnGlobal()
	if PLYRTEAM == currentTeamTurn: # aka if the player is the one chosing
		var chosen = await boardClickReporter.ClickedMiniBoard
		return chosen
	else:
		var options = [-1,0,1]
		var chosen = Vector2i(options.pick_random(),options.pick_random())
		await get_tree().create_timer(2).timeout
		return chosen
