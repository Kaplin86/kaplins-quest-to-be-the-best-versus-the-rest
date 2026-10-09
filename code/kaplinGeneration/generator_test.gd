extends Node2D

func _ready():
	var generator = load("res://scenes/kaplinGeneration/generator.tscn")
	var count = 0
	for A in Ref.FaceCount:
		for B in Ref.TorsoCount:
			for C in Ref.FinCount:
				for D in Ref.HeadCount:
					for E in Ref.HatCount:
						count += 1
						var newGen : KaplinVisual = generator.instantiate()
						add_child(newGen)
						newGen.face = A
						newGen.torso = B
						newGen.fin = C
						newGen.head = D
						newGen.hat = E
						newGen.global_position = Vector2.ZERO + Vector2(120 * (count % 30),floor(count / 30) * 200)
