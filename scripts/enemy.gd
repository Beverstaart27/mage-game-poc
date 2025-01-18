extends CharacterBody2D

class_name enemy

var health: float
@onready var player = get_node("../Character")


func lowerHealth(amount: float)-> void:
	health -= amount
	if(health < 0):
		
		print(player.get_node("UrgeRepressionBar"))
		player.get_node("UrgeRepressionBar").addUrgeRepression()
		queue_free()
