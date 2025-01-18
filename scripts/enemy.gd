extends CharacterBody2D

class_name enemy

var health: float
@export var killUrge: Node


func lowerHealth(amount: float)-> void:
	health -= amount
	if(health < 0):
		print(killUrge)
		#killUrge.addUrgeRepression()
		queue_free()
