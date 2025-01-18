extends CharacterBody2D

class_name enemy

var health: float
@onready var killUrge:Label = $"../Control".get_child(0)

func lowerHealth(amount: float)-> void:
	health -= amount
	if(health < 0):
		killUrge.addUrgeRepression()
		queue_free()
