extends Node2D

class_name enemy

var health: float
@onready var killUrge:Label = $"../Control".get_child(0)


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func lowerHealth(amount: float)-> void:
	health -= amount
	if(health < 0):
		print(killUrge)
		killUrge.addUrgeRepression()
		queue_free()
